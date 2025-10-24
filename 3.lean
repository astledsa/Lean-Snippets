inductive Tree where
  | leaf (x: Nat)
  | branch (x: Nat) (left right: Tree)

def infixTraverse : Tree -> List Nat
  | .leaf x => [x] 
  | .branch x left right => x :: (infixTraverse right) ++ (infixTraverse left)

#eval infixTraverse (.branch 5 ((.branch 3 (.leaf 1) (.leaf 2))) ((.branch 10 (.leaf 11) (.leaf 12))))
