--String
str :: [Char]
str = "hello"

--Functions
add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

--Polymorphic Functions
getLength :: [t] -> Int
getLength list = length(list)

--Typeclasses in Polymorphic Functions
showSum :: (Num t, Show t) => [t] -> [Char]
showSum list = show(sum(list))

--Type synonym
type String = [Char]
type Point = (Double, Double)

