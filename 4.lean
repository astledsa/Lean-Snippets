structure Complex where
  re: Int
  im: Int
  deriving BEq

instance: Add Complex where
  add x y := ⟨x.re + y.re, x.im + y.im⟩

instance: Sub Complex where
  sub x y := ⟨x.re - y.re, x.im - y.im⟩

instance: Mul Complex where
  mul x y := ⟨(x.re * y.re) - (x.im * y.im), 
              (x.re * y.im) + (x.im * y.re)⟩

instance: Div Complex where
  div x y := ⟨((x.re * y.re) + (x.im * y.im))/(y.re^2 + y.im^2), 
              ((x.im * y.re) - (x.re * y.im))/(y.re^2 + y.im^2)⟩
