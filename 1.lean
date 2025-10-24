def C number index := 
  match number with
    | 1 => if index == 2 then true else false
    | 3 => if index < 1 ∨ index > 3 then false else true
    | 5 => true
    | _ => false

def F x :=
  if x < 3 then
    match x with
      | 0 => 1
      | x+1 => 2 + (F x)
  else
    1

def R x y :=
  match y with 
    | 0 => ""
    | y+1 => if (C x y) then "*" ++ (R x y) else " " ++ (R x y)

def S x := R x 5

#eval 
IO.println 
  (
    "\n".intercalate 
    (
      List.map S 
      (
        List.map F 
        (
          List.range 5
        )
      )
    )
  )
