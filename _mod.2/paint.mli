type mg
val new_img : unit -> mg
val add_pnt : (int * int) -> int -> mg -> mg
val add_clr : int -> int * int * int -> mg -> mg
val print_img : int * int * int * int -> mg -> unit

(*
type pnt = (int * int)
type ndx = int
type clr = (int * int * int)
type mg = (pnt * ndx) list * (ndx * clr) list
*)
(**  *)

(*
val test0 : unit -> unit
(** [test-0] *)
*)

module Fld : sig
val fld : (int -> 'a -> 'a) -> 'a -> int -> 'a
end
module Lst : sig
val ass_find : 'a -> ('a * 'b) list -> 'b
end

val add_rct :
  int * int * int * int ->
  int -> mg -> mg

(*
let add_rct (x, y, w, h) d mg =

type rct (* x, y, w, h *) = 
  int * int * int * int
*)
