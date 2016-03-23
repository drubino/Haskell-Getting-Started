module Monads where
import Control.Monad.Reader
import Control.Monad.State
import Control.Monad.ST
import Control.Monad
import Data.STRef

--Defining the Monad type class
class Monad' m where
    return' :: t -> m t
    bind' :: m t -> (t -> m u) -> m u

instance Monad' [] where
    return' t = [t]
    bind' [] _ = []
    bind' (first : rest) projection = projection(first) ++ bind'(rest)(projection)
    
--Defining the add function for Monads
addM :: (Monad m, Num n) => m n -> m n -> m n
addM' :: (Monad m, Num n) => m n -> m n -> m n
addM mx my = mx >>= (\x -> my >>= (\y -> return(x + y)))
addM' mx my = do
    x <- mx
    y <- my
    return(x + y)
    
--The Reader Monad
getFirstStatement :: Reader String String
getFirstStatement = do 
    name <- ask
    return(name ++ " woke up")
getSecondStatement :: Reader String String
getSecondStatement = do
    name <- ask
    return(name ++ " wrote some Haskell")
getStory :: Reader String String
getStory = do 
    firstStatement <- getFirstStatement
    secondStatement <- getSecondStatement
    return ("First, " ++ firstStatement ++ ". Second, " ++ secondStatement ++ ".")
story = do 
    name <- getLine
    return(runReader(getStory)(name))
    
--The State Monad
harmonicStep :: State (Double, Double) Double
harmonicStep = do
    (position, velocity) <- get 
    let acceleration = (-0.01 * position)
        velocity' = velocity + acceleration
        position' = position + velocity'
    put(position', velocity')
    return(position)
    
harmonic :: State (Double, Double) [Double]
harmonic = do 
    position <- harmonicStep
    laterPositions <- harmonic
    return(position : laterPositions)
    
positions = evalState(harmonic)(1,0)

--ST Monad
sumST :: [Int] -> STRef s Int -> ST s ()
sumST [] sumRef = return ()
sumST (first : rest) sumRef = do 
    sum <- readSTRef(sumRef)
    writeSTRef(sumRef)(sum + first)
    sumST(rest)(sumRef)

sum' :: [Int] -> Int
sum' list = runST $ do
    sum <- newSTRef(0)
    sumST(list)(sum)
    readSTRef(sum)
    
--lifting functions into monads
addMaybe :: Num t => Maybe t -> Maybe t-> Maybe t
addMaybe m1 m2 = liftM2(+)(m1)(m2)