open! Core
open Cmdliner

module Top_hit_cli = struct
  open Lib.Top_hit

  let cmd_name = "top_hit"

  let in_btab_term =
    let doc = "Input btab file" in
    Arg.(
      required & pos 0 (some non_dir_file) None & info [] ~docv:"IN_BTAB" ~doc)

  let out_btab_term =
    let doc = "Output btab file.  (Use /dev/stdout to write to stdout.)" in
    Arg.(required & pos 1 (some string) None & info [] ~docv:"OUT_BTAB" ~doc)

  let best_method_term =
    let doc =
      "Do you want the single overall best hit for each query, or do you want \
       the best hit among each unique query-target pair?  (overall or pair)"
    in
    Arg.(
      value
      & opt Best_method.conv Best_method.default
      & info [ "b"; "best-method" ] ~docv:"BEST_METHOD" ~doc)

  let compare_column_term =
    let doc =
      "Do you want to use bit score, E-value, or percent identity to determine \
       the best hit?  (bits, evalue, pident)"
    in
    Arg.(
      value
      & opt Compare_column.conv Compare_column.default
      & info [ "c"; "compare-column" ] ~docv:"COMPARE_COLUMN" ~doc)

  let term =
    Term.(
      const Opts.v $ in_btab_term $ out_btab_term $ best_method_term
      $ compare_column_term)

  let info =
    let doc = "Pick best hits from a btab file" in
    let man = [] in
    Cmd.info cmd_name ~doc ~man
end

module Subcommand = struct
  type t = Top_hit of Lib.Top_hit.Opts.t [@@deriving variants]

  let top_hit =
    let term = Term.(const top_hit $ Top_hit_cli.term) in
    Cmd.v Top_hit_cli.info term

  let cmds = [ top_hit ]
end
