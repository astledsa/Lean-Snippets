structure RecorderM (α) where
  store: List String
  value :  α

instance : Monad RecorderM where
  pure x := ⟨[], x⟩ 
  bind m f := 
    let log := m.store
    let val := m.value
    let newR := f val
    let logs2 := newR.store
    ⟨List.append log logs2, newR.value⟩ 

def RecorderM.print (s: String): RecorderM Unit := ⟨[s], ()⟩ 
def RecorderM.run (self: RecorderM α) : List String := self.store
