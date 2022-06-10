open! Core

module Best_method = struct
  type t = Overall | Pair

  let of_string = function
    | "overall" | "Overall" -> Some Overall
    | "pair" | "Pair" -> Some Pair
    | _ -> None

  let to_string = function Overall -> "overall" | Pair -> "pair"
  let pp fmt t = Format.fprintf fmt "%s" @@ to_string t
  let conv = Utils.make_conv ~of_string ~pp ~description:"overall or pair"
  let default = Overall
end

module Compare_column = struct
  type t = Bits | Evalue | Pident

  let of_string = function
    | "bits" | "Bits" -> Some Bits
    | "evalue" | "Evalue" -> Some Evalue
    | "pident" | "Pident" -> Some Pident
    | _ -> None

  let to_string = function
    | Bits -> "bits"
    | Evalue -> "evalue"
    | Pident -> "pident"

  let pp fmt t = Format.fprintf fmt "%s" @@ to_string t

  let conv =
    Utils.make_conv ~of_string ~pp ~description:"bits, evalue, or pident"

  let default = Bits

  let to_search_record_field = function
    | Bits -> Btab.Record.Fields.bits
    | Pident -> Btab.Record.Fields.pident
    | Evalue -> Btab.Record.Fields.evalue

  let is_new_better ~old ~new_ = function
    | Bits | Pident -> Float.(new_ > old)
    | Evalue -> Float.(new_ < old)

  let is_new_better' column ~old_record ~new_record =
    let field = to_search_record_field column in
    let old = Field.get field old_record in
    let new_ = Field.get field new_record in
    is_new_better column ~old ~new_
end

let make_key record best_method =
  let open Btab in
  match best_method with
  | Best_method.Overall -> Record.query record
  | Pair ->
      let q = Record.query record in
      let t = Record.target record in
      q ^ t

let get_top_hits fname best_method compare_column =
  let open Btab in
  let open Or_error.Let_syntax in
  let hits = Hashtbl.create (module String) in
  let%map () =
    In_channel.with_file_iteri_records fname ~f:(fun i r ->
        if Int.(i > 0 && i mod 200_000 = 0) then (
          eprintf "READING %dk\r" (i / 1000);
          Out_channel.flush Out_channel.stderr);

        let key = make_key r best_method in
        Hashtbl.update hits key ~f:(function
          | None -> r
          | Some old_record ->
              if
                Compare_column.is_new_better' compare_column ~old_record
                  ~new_record:r
              then r
              else old_record))
  in
  hits

let print_records records out_btab =
  let print_record oc r =
    let s = Btab.Record.to_string r in
    Out_channel.output_string oc [%string "%{s}\n"]
  in
  Out_channel.with_file out_btab ~f:(fun oc ->
      Hashtbl.iter records ~f:(print_record oc))

module Opts = struct
  type t = {
    in_btab : string;
    out_btab : string;
    best_method : Best_method.t;
    compare_column : Compare_column.t;
  }

  let v in_btab out_btab best_method compare_column =
    { in_btab; out_btab; best_method; compare_column }
end

let run Opts.{ in_btab; out_btab; best_method; compare_column } =
  prerr_endline "LOG -- Reading records";

  let top_hits =
    Utils.value_or_exit ~tag:"get_top_hits failed"
    @@ get_top_hits in_btab best_method compare_column
  in

  prerr_endline "LOG -- Writing records";

  print_records top_hits out_btab
