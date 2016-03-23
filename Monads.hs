module Monads where

--Defining the Monad type class
class Monad' m where
    return' :: t -> m t
    bind' :: m t -> (t -> m u) -> m u

instance Monad' [] where
    return' t = [t]
    bind' [] _ = []
    bind' (first : rest) projection = projection(first) ++ bind'(rest)(projection)
    
--Defining the add function for Monads
addM :: (Monad m, Num n) => m n -> m n -> m n
addM' :: (Monad m, Num n) => m n -> m n -> m n
addM mx my = mx >>= (\x -> my >>= (\y -> return(x + y)))
addM' mx my = do
    x <- mx
    y <- my
    return(x + y)
    

    