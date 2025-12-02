structure RecorderM (α) where
  store: List String
  value :  α

instance : Monad RecorderM where
  pure x := ⟨[], x⟩ 
  bind m f := 
    let newR := f m.value
    let logs2 := newR.store
    ⟨List.append m.store newR.store, newR.value⟩ 

def RecorderM.print (s: String): RecorderM Unit := ⟨[s], ()⟩ 
def RecorderM.run (self: RecorderM α) : List String := self.store
