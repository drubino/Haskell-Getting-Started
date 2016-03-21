module TypeClasses(
    contains,    
    RGB(..)
) where

--Requires the Eq type class context for the type parameter
contains :: (Eq t) => t -> [t] -> Bool
contains _ [] = False 
contains element (head : tail) 
    | element == head   = True
    | otherwise         = contains(element)(tail)
    
--Implementing the Eq type class
data RGB = RGB Int Int Int
instance Eq RGB where
    (RGB r1 g1 b1) == (RGB r2 g2 b2) = 
        (r1 == r2) && (g1 == g2) && (b1 == b2)
        
