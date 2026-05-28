## how-to draw a circle, w/ `.2`,

```
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
```

