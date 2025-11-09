inductive Ex (α) where
  | fail (s: String) : Ex α
  | value (n: α) : Ex α

instance : Monad Ex where
  pure x := Ex.value x
  bind m f := 
    match m with
      | .fail s => .fail s
      | .value n => f n

def Ex.run (v: Ex Nat) : IO Unit := 
  match v with
    | .fail s => IO.println (s)
    | .value n => IO.println (n)

def compute (x : Nat) : Ex Nat := do
  if x == 0 then  
    .fail "cannot divide by 0"
  let y := 15 / x
  return y
