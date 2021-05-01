module Main

import Data.Vect

data HVect1 : Vect k Type -> Type where
    Nil  : HVect1 []
    (::) : (1 _ : t) -> (1 _ : HVect1 ts) -> HVect1 (t :: ts)

partial
happly : {k : Nat} -> {0 as, bs : Vect k Type}
      -> (1 _ : HVect1 as)
      -> (1 _ : HVect1 (zipWith (\a, b => ((1 _ : a) -> b)) as bs))
      -> HVect1 bs
happly {bs=[]} [] [] = []
happly {bs=_::_} (x::xs) (f::fs) = f x :: happly xs fs
