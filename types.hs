module Types(
    str,
    add3,
    getLength,
    showSum,
    String',
    CustomerId(..),
    customerIdToInt,
    Customer'(..),
    alice,
    sally,
    Customer(..),
    getCustomerId,
    getCustomerNameId,
    getCustomerLuckyNumber,
    StringTree(..),
    Bool'(..),
    not',
    and',
    or',
    DialogResponse(..)
) where

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
type String' = [Char]

--newtype
newtype CustomerId = CustomerId Int
customerIdToInt :: CustomerId -> Int 
customerIdToInt (CustomerId i) = i

--Record Types
data Customer' = Customer' {
    customerId :: CustomerId,
    name :: String,
    luckyNumber :: Int
}
alice :: Customer' 
alice = Customer' {
    customerId = CustomerId(0),
    name = "Alice",
    luckyNumber = 7
}
sally = alice { name = "Sally", luckyNumber = 84 }

--Algebraic Data Types
data Customer = Customer CustomerId String Int
getCustomerId (Customer id _ _) = id
getCustomerNameId (Customer _ name _) = name
getCustomerLuckyNumber (Customer _ _ luckyNumber) = luckyNumber
data StringTree = StringTree String [StringTree]

--Algebraic Data Types with Multiple Constructors
data Bool' = False' | True'
not' True' = False'
not' False' = True'
and' True' True' = True'
and' False' b = False'
and' b False' = False'
or' False' False' = False'
or' True' b = True'
or' b True' = True'

--Algebraic data types with multiple empty constructors are enums
data DialogResponse = Yes | No | Help | Quit


