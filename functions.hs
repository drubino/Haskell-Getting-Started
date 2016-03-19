--Returns the square of x
square x = x * x

--Returns true if x is positive; false otherwise
isPositive x = x > 0
    
--Returns the nth power of 2
pow2 n
    | n < 0     = 0/0
    | n == 0    = 1
    | otherwise = 2 * pow2(n-1)
    
--Returns a string concatenated with itself n times
repeatString str n
    | n == 0    = ""
    | n == 1    = str
    | otherwise = str ++ repeatString(str)(n-1)
    
--Returns the element at the specified index
elementAt list index = case list of
    [] -> undefined
    (element : list) ->  
        if index < 0
        then undefined
        else if index == 0
        then element
        else elementAt(list)(index-1)
    
--Selects a value for each value in the list
select [] selector = []
select (element : list) selector = selector(element) : select(list)(selector)

--A list of all natural numbers
naturalNumbersFrom n = n : naturalNumbersFrom(n+1)
naturalNumbers = naturalNumbersFrom(1)

--Git Test


    