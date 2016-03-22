module TypeClasses where

--Requires the Eq type class context for the type parameter
contains :: (Eq t) => t -> [t] -> Bool
contains _ [] = False 
contains element (head : tail) 
    | element == head   = True
    | otherwise         = contains(element)(tail)
    
--Implementing the Eq and Show type classes
data RGB = RGB Int Int Int
    deriving Eq
instance Show RGB where
    show (RGB r g b) = 
        "RGB" ++ " " ++ 
        (show(r)) ++ " " ++ 
        (show(g)) ++ " " ++ 
        (show(b))

--Type classes on parameterized types
data Maybe' t = Nothing' | Just' t
instance (Eq t) => Eq (Maybe' t) where 
    Nothing' == Nothing' = True
    Nothing' == (Just' _) = False
    (Just' _) == Nothing' = False
    (Just' x) == (Just' y) = x == y 
    
--Defining type classes
class Eq' t where 
    (.==) :: t -> t -> Bool
    (./=) :: t -> t -> Bool
    x ./= y = not(x .== y)
    x .== y = not(x ./= y)
    
class (Eq' t) => Ord' t where 
    (.<)    :: t -> t -> Bool
    (.<=)   :: t -> t -> Bool
    (.>)    :: t -> t -> Bool
    (.>=)   :: t -> t -> Bool

--Defining the type class Measurable 
class Measurable t where
    distance :: t -> t -> Double
    
pathLength :: (Measurable t) => [t] -> Double
pathLength [] = 0
pathLength (_ : []) = 0
pathLength (first : second : rest) = distance(first)(second) + pathLength(second : rest)
