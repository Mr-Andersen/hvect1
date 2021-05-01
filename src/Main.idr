module Main

import Data.Vect

data HVect1 : Vect k Type -> Type where
    Nil  : HVect1 []
    (::) : (1 _ : t) -> (1 _ : HVect1 ts) -> HVect1 (t :: ts)

zipVect : (a -> b -> c) -> Vect k a -> Vect k b -> Vect k c
zipVect = zipWith

partial
happly : {0 k : Nat} -> {0 as, bs : Vect k Type}
      -> (1 _ : HVect1 as)
      -> (1 _ : HVect1 (zipVect {k} (\a, b => (a -> b)) as bs))
      -> HVect1 bs
happly [] =
    \case
        [] => ?hole1
        xs => ?hole2
