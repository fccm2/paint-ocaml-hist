module Fld = Paint.Fld
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (1, 0, 0) mg in
  let mg = P.add_clr 1 (0, 0, 1) mg in
  let mg = P.add_clr 2 (1, 1, 0) mg in
  let mg = P.add_clr 3 (0, 1, 1) mg in
  let mg = P.add_clr 4 (1, 1, 1) mg in
  let mg = P.add_clr 5 (1, 0, 1) mg in

  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        P.add_pnt (i, j) 2 mg
      ) mg 5
    ) mg 10
  in

  let mg = Fld.fld (fun i mg -> P.add_pnt (i, 1) 5 mg) mg 15 in
  let mg = Fld.fld (fun j mg -> P.add_pnt (j, 4) 5 mg) mg 30 in

  (*
  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        P.add_pnt (i+x, j+y) 4 mg
      ) mg h
    ) mg w
  in
  *)

  let r = 10 in
  let xc, yc = (30, 20) in

  let mg = P.add_crl (xc, yc) r 5 mg in

  P.print_img (0, 0, 100, 80) mg

