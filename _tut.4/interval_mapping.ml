let interv_map ab cd (e) =
  let a, b = (ab) in
  let c, d = (cd) in
  let ab_diff = (b - a) in
  let cd_diff = (d - c) in
  let f = (e - a) in
  ((f * cd_diff) / ab_diff) + c

let () =
  Printf.printf "# interval mapping: x from the interval 20, 45\n%!";
  Printf.printf "# interval mapping: y from the interval 10, 20\n%!";
  Printf.printf "# p0: x, y = 20, 10\n%!";
  Printf.printf "# p1: x, y = 45, 20\n%!";
  Printf.printf "# interval mapping:  x  y\n%!";
  let ab = (20, 45) in
  let cd = (10, 20) in
  for e = 20 to 45 do
    let r = interv_map ab cd (e) in
    Printf.printf "# interval mapping: %d %d\n%!" e r;
  done;
;;
