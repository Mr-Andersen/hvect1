module Main

import Data.Vect

data HVect1 : Vect k Type -> Type where
    Nil  : HVect1 []
    (::) : (1 _ : t) -> (1 _ : HVect1 ts) -> HVect1 (t :: ts)

happly : {0 k : Nat} -> {0 as, bs : Vect k Type}
      -> (1 _ : HVect1 as)
      -> (1 _ : HVect1 (zipWith (\a, b => (a -> b)) as bs))
      -> HVect1 bs
happly [] [] = ?h1 -- []
happly (f::fs) (x::xs) = ?h2 -- f a :: happly fs xs
