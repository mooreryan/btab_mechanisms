open! Core

(* No need to use a fold here as user will generally enter a file that has no
   repeated IDs. *)
let read_ids fname = Set.of_list (module String) @@ In_channel.read_lines fname

let process_btab ~in_btab ~out_btab ~ids =
  let open Btab in
  Out_channel.with_file out_btab ~f:(fun oc ->
      In_channel.with_file_iteri_records in_btab ~f:(fun i r ->
          if Int.(i > 0 && i mod 200_000 = 0) then (
            eprintf "READING %dk\r" (i / 1000);
            Out_channel.flush Out_channel.stderr);

          if Set.mem ids (Record.query r) && Set.mem ids (Record.target r) then
            Out_channel.output_string oc (Record.to_string r ^ "\n")))

module Opts = struct
  type t = { in_btab : string; out_btab : string; id_file : string }

  let v in_btab out_btab id_file = { in_btab; out_btab; id_file }
end

let run Opts.{ in_btab; out_btab; id_file } =
  prerr_endline "LOG -- Reading IDs";
  let ids = read_ids id_file in

  prerr_endline "LOG -- Processing btab";
  Utils.value_or_exit ~tag:"process_btab failed"
  @@ process_btab ~in_btab ~out_btab ~ids
