open! Core

let make_conv ~of_string ~pp ~description =
  let parser s =
    Cmdliner.Arg.parser_of_kind_of_string ~kind:description of_string s
  in
  Cmdliner.Arg.conv (parser, pp)

let abort ?(code = 1) msg =
  prerr_endline msg;
  Caml.exit code

let value_or_exit : ?tag:string -> 'a Or_error.t -> 'a =
 fun ?tag oe ->
  match oe with
  | Ok x -> x
  | Error error ->
      let error =
        match tag with None -> error | Some tag -> Error.tag error ~tag
      in
      let error = Error.to_string_hum error in
      abort [%string "ERROR -- %{error}"]
