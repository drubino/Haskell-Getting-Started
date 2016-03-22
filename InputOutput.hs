module InputOutput(
    helloWorld
) where

--The program expects a main function
main :: IO ()
main = putStrLn("Hello World") -- Printed
main2 :: IO ()
main2 = putStrLn("Hello World") -- Not Printed 

--Several IO actions can be done with a do block
helloWorld = do
    putStrLn("Hello")
    putStrLn("World")
    
 
