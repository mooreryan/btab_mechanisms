open! Core

module Root = struct
  let cmd_name = "bm"
  let version = "1.0.0"

  open Cmdliner

  let info =
    let doc = "Some spiffy btab tools" in
    let man = [] in
    Cmd.info cmd_name ~version ~doc ~man

  let cmd = Cmd.group info Cli.Subcommand.cmds

  type parse_result = Run of Cli.Subcommand.t | Exit of int

  let parse () =
    match Cmd.eval_value cmd with
    | Ok (`Ok opts) -> Run opts
    | Ok `Help | Ok `Version -> Exit 0
    | Error _ -> Exit 1

  let parse_or_exit () =
    match parse () with Run opts -> opts | Exit code -> Caml.exit code
end

let main () =
  match Root.parse_or_exit () with
  | Cli.Subcommand.Top_hit opts -> Lib.Top_hit.run opts
  | Cli.Subcommand.Pick opts -> Lib.Pick.run opts

let () = main ()
