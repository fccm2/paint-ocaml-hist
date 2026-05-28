module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (1, 0, 0) mg in
  let mg = P.add_clr 1 (0, 0, 1) mg in

  let mg = P.add_pnt (0, 0) 0 mg in
  let mg = P.add_pnt (0, 1) 0 mg in
  let mg = P.add_pnt (1, 0) 0 mg in

  let mg = P.add_pnt (2, 1) 1 mg in
  let mg = P.add_pnt (1, 2) 1 mg in
  let mg = P.add_pnt (2, 2) 1 mg in

  P.print_img (0, 0, 10, 10) mg

