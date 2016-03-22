module InputOutput(
    helloWorld,
    echo,
    readTwice,
    reverseLineAction
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

--Reading data from the console
echo :: IO ()
echo = do
    line <- getLine
    putStrLn(line)
    echo
    
--Let in do blocks
readTwice :: IO ()
readTwice = do
    line1 <- getLine
    line2 <- getLine
    let lines = line1 ++ " " ++ line2
    putStrLn(lines)
    
--The interact function
reverseLine :: String -> String
reverseLine input = unlines(map(reverse)(lines(input)))
reverseLineAction = interact(reverseLine)

 
