-- Exercise 1.6.5
-- 1
def exGetLast : List Nat -> Option Nat
  | [] => none
  | [x] => some x
  | _ :: xs => exGetLast xs

-- 2
def List.findFirst? { α: Type } (xs: List α) (predicate: α -> Bool) : Option α := 
  match xs with
    | [] => none
    | h :: t => if (predicate h) then some h else t.findFirst? predicate

-- 3
def Prod.switch {α β: Type} (pair: α × β) : β × α := ⟨ pair.snd, pair.fst ⟩ 

-- 4
def PetName (α: Type) : Type := Sum α α

-- 5
def zip (smaller: List α) (bigger: List β) : List (α × β) :=
  match smaller with
    | [] => []
    | sh :: st => match bigger with
      | [] => []
      | bh :: bt => ⟨sh, bh⟩ :: (zip st bt)

-- 6
def take (n: Nat) (xs: List α) : List α := 
  match n with
   | 0 => []
   | n + 1 => match xs with
    | [] => []
    | xh :: xt => xh :: (take n xt)

-- 7
def dist (p: α × (β ⊕ γ)) : (α × β) ⊕ (α × γ) :=
  match p with
    | (α, Sum.inl β) => Sum.inl (α, β)
    | (α, Sum.inr γ) => Sum.inr (α, γ)


-- 8
def mult (p: Bool × α) : α ⊕ α := 
  match p with
    | (true, x) => Sum.inl x
    | (false, x) => Sum.inr x
