--String
str :: [Char]
str = "hello"

--Functions
add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

--Polymorphic Functions
getLength :: [t] -> Int
getLength list = length(list)