(* this is an -*- sml -*- file *)

(*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: BSD-2-Clause
 *)

val _ = PolyML.Compiler.prompt1:="";
val _ = PolyML.Compiler.prompt2:="";
val _ = PolyML.print_depth 0;
val dir = valOf (OS.Process.getEnv "MLLEX_PFX")
val _ = use (dir^"/mllex.ML");

fun main() = let
  val name = CommandLine.name()
in
  case CommandLine.arguments() of
    [] => (TextIO.output(TextIO.stdErr, name ^ ": no arguments\n");
           OS.Process.exit OS.Process.failure)
  | args => List.app LexGen.lexGen args
end;

val _ = PolyML.shareCommonData main;
val _ = PolyML.export(dir ^ "/mllex", main);

