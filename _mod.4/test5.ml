module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 1, 0) mg in

  let x0, x1 = (10, 30) in
  let ps = P.new_ln_h (x0, x1) 10 in

  let fld_init f init lst =
    let rec aux temp_res lst =
      match lst with
      | v::tl -> aux (f temp_res v) tl
      | [] -> temp_res
    in
    aux init lst
  in

  let mg = fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  let y0, y1 = (4, 14) in
  let ps = P.new_ln_v 15 (y0, y1) in

  let mg = fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  let xc, yc = (30, 6) in
  let ps = P.new_crl (xc, yc) 4 in

  let mg = fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  let x, y, w, h = (24, 10, 10, 4) in
  let ps = P.new_rct (x, y, w, h) in

  let mg = fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  P.print_img (0, 0, 40, 15) mg
