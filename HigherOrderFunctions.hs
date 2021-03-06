module HigherOrderFunctions where

--Composes functions f and g
compose f g x = f(g(x))

--The constant function that always returns 7
seven = const 7

--Currying the add function
add x y = x + y
add3 = add(3)
add3' = (+)(3)
add3'' = (+3)

--Creating the .+ operator
(a,b) .+ (c,d) = (a+c, b+d)

--The map function
lengths list = map(length)(list)

--The filter function
nonEmpty list = filter(\x -> not(null(x)))(list)

--The fold function
sumList list = foldl(+)(0)(list)

--The zip function
pointwiseSum list1 list2 = map(\(x,y) -> x + y)(zip(list1)(list2))
pointwiseSum' list1 list2 = zipWith(+)(list1)(list2)

--Function composition
notNull x = (not.null)(x)