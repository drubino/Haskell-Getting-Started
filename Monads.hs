module Monads where

--Defining the Monad type class
class Monad' m where
    return' :: t -> m t
    bind' :: m t -> (t -> m u) -> m u
    
instance Monad' [] where
    return' t = [t]
    bind' [] _ = []
    bind' (first : rest) projection = projection(first) ++ bind'(rest)(projection)
    