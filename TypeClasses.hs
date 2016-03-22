module TypeClasses(
    contains,    
    RGB(..),
    contains
) where

--Requires the Eq type class context for the type parameter
contains :: (Eq t) => t -> [t] -> Bool
contains _ [] = False 
contains element (head : tail) 
    | element == head   = True
    | otherwise         = contains(element)(tail)
    
--Implementing the Eq and Show type classes
data RGB = RGB Int Int Int
instance Eq RGB where
    (RGB r1 g1 b1) == (RGB r2 g2 b2) = 
        (r1 == r2) && (g1 == g2) && (b1 == b2)
instance Show RGB where
    show (RGB r g b) = 
        "RGB" ++ " " ++ 
        (show(r)) ++ " " ++ 
        (show(g)) ++ " " ++ 
        (show(b))
