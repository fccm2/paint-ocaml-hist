## how-to make a difference between two shapes, w/ `.6`,

```
  let xc, yc = (30, 7) in
  let ps0 = P.new_crl (xc, yc) 6 in

  let x, y, w, h = (25, 10, 10, 4) in
  let ps1 = P.new_rct (x, y, w, h) in

  let is_in p ps =
    let rec aux_in ps =
      match ps with
      | p0::ps -> if p0 = p then true else aux_in ps
      | [] -> false
    in
    aux_in ps
  in
  let ps =
    let rec aux ps0 ps1 cc =
      match ps0 with
      | p::ps0 -> if is_in p ps1 then aux ps0 ps1 cc else aux ps0 ps1 (p::cc)
      | [] -> cc
    in
    aux ps0 ps1 []
  in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in
```

