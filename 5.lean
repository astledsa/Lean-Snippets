-- clist is custom list

inductive clist (α) where
  | nil: clist α
  | cons (head: α) (tail: clist α) : clist α


def clist.map (f: α -> β) (l: clist α): clist β :=
  match l with
    | .nil => clist.nil
    | .cons h t => clist.cons (f h) (clist.map f t)

instance: Functor clist where
  map := clist.map
