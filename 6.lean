inductive mList (α) where
  | nil: mList α
  | cons (head: α) (tail: mList α) : mList α

def mlist.append (l1 l2 : mList α) : mList α :=
  match l1 with
  | .nil => l2
  | .cons h t => .cons h (mlist.append t l2)

def mlist.map (f: α -> β) (l: mList α): mList β :=
  match l with
    | .nil => .nil
    | .cons h t => .cons (f h) (mlist.map f t)

def mlist.bind (m : mList α) (f : α → mList β) : mList β :=
  match m with
  | .nil => .nil
  | .cons h t => mlist.append (f h) (mlist.bind t f)

instance : Monad mList where
  pure x := mList.cons x mList.nil
  bind := mlist.bind
