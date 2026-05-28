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
val fld_init : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a
val fld : (int -> 'a -> 'a) -> 'a -> int -> 'a
end
module Lst : sig
val diff : 'a list -> 'a list -> 'a list
val ass_find : 'a -> ('a * 'b) list -> 'b
end

val new_rct :
  int * int * int * int ->
  (int * int) list

val new_crl :
  int * int -> int -> 
  (int * int) list

val add_crl :
  int * int -> int -> 
  int -> mg -> mg

(*
 add_crl (xc, yc) r d mg

*)

val add_rct :
  int * int * int * int ->
  int -> mg -> mg

(*
let add_rct (x, y, w, h) d mg =

type rct (* x, y, w, h *) = 
  int * int * int * int
*)

val new_ln_h : int * int -> int -> (int * int) list
val new_ln_v : int -> int * int -> (int * int) list

val new_crl : int * int -> int -> (int * int) list
val new_rct : int * int * int * int -> (int * int) list

(*
  new_ln_h (x0, x1) y
  new_ln_v x (y0, y1)

  new_crl (xc, yc) r
  new_rct (x, y, w, h)

*)

