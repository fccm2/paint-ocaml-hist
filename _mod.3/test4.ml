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
  let x1, y1 = (xc+r, yc+r) in
  let x0, y0 = (xc-r, yc-r) in
  let w, h = (x1-x0+1, y1-y0+1) in
  let x, y = (x0, y0) in

  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        let ti = xc - (i+x) in
        let tj = yc - (j+y) in
        let td = (ti * ti) + (tj * tj) in
        if td < (r * r)
        then P.add_pnt (i+x, j+y) 1 mg else mg
      ) mg h
    ) mg w
  in

  P.print_img (0, 0, 100, 80) mg

