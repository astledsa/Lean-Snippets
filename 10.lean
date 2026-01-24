-- 1
def prop1 : Prop := 2 + 3 = 5
def prop2 : Prop := 15 - 8 = 7
def prop3 : Prop := "Hello, ".append "world" = "Hello, world"
def prop4 : Prop := 5 < 18 

theorem p1 : prop1 := rfl
theorem p2 : prop2 := rfl
theorem p3 : prop3 := rfl
-- theorem p4 : prop4 := rfl is wrong since any comparison is not definitional, but
-- propositional equality

-- 2
theorem d1 : 2 + 3 = 5 := by decide
theorem d2 : 15 - 8 = 7 := by decide
theorem d3 : "Hello, ".append "world" = "Hello, world" := by decide
theorem d4 : 5 < 18 := by decide

-- 3
def LookFifth (x : List α) (ok : x.length > 4) : α := x[4]
