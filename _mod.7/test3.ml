module Fld = Paint.Fld
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (1, 0, 0) mg in
  let mg = P.add_clr 1 (0, 0, 1) mg in
  let mg = P.add_clr 2 (1, 1, 0) mg in
  let mg = P.add_clr 3 (0, 1, 1) mg in

  let mg = P.add_rct (10, 20, 30, 10) 3 mg in

  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        P.add_pnt (i, j) 2 mg
      ) mg 5
    ) mg 10
  in

  let mg = Fld.fld (fun i mg -> P.add_pnt (i, 0) 0 mg) mg 10 in
  let mg = Fld.fld (fun j mg -> P.add_pnt (j, 1) 1 mg) mg 10 in

  P.print_img (0, 0, 90, 70) mg
