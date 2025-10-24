structure Point where
  x: Nat
  y: Nat

def f (p: Point) := 
  if p.x < p.y then
    (⟨ p.x, p.y ⟩: Point)
  else
    (⟨ p.y, p.x ⟩: Point)

#eval f { x := 2, y := 1 }
