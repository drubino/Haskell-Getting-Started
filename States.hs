module States where
import Control.Monad.State.Lazy

runState' state value = (evalState(state)(value), execState(state)(value))

x = 'x'  
x1 = runState(return(x))(1) --('x',1)
x2 = runState(get)(1) --(1,2)
x3 = runState(put(5))(1) --((),5)
x4 = runState(do { put(5); return(x) })(1) --('x',5)

postIncrement = do
    x <- get
    put(x + 1)
    return(x)

x5 = runState(postIncrement)(0) --(0,1)

preDecrement = do 
    x <- get
    put(x-1)
    get

x6 = runState(preDecrement)(0) --(-1,-1)
