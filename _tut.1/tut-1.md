## how-to draw a rectangle, w/ `.1`,

```
  let w, h = (40, 10) in
  let x, y = (10, 5) in
  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        P.add_pnt (i+x, j+y) 2 mg
      ) mg h
    ) mg w
  in
```

