## how-to 01, how-to create a new image, with one pixel colored,

```
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 0, 1) mg in

  let x, y = (10, 10) in
  let mg = P.add_pnt (x, y) 0 mg in

  P.print_img (0, 0, 100, 80) mg
```

with `P.new_img`, we initialize a new image,

this `Paint` module uses indexed colors,  
so a new color is added to the available  
palette with: `P.add_clr`

here `0` is the index of the color,  
and `(0, 0, 1)` are the `(r, g, b)`  
values, `0` or `1`, for the maximum  
or the minimum luminescense of the color  
component,

After `P.add_pnt` draws a point,  
with the color `0`,

If you just want to create a new  
empty image, and print-it,  

```
module P = Paint
let () =
  let mg = P.new_img () in
  P.print_img (0, 0, 10, 5) mg
```

the image will have the dimensions:  
`[10, 5]` (width, height)

