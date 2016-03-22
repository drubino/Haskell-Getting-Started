module Collections(
    module S,
    module M,
    toSet
) where 
    
import qualified Data.Set as S 
import qualified Data.Map as M

--Set
toSet list = toSet'(list)(S.empty)
toSet' (first : rest) set = toSet'(rest)(S.insert(first)(set))
toSet' [] set = set

--map

