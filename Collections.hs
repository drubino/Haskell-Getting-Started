module Collections where 
    
import qualified Data.Set as S 
import qualified Data.Map as M

--Set
toSet list = toSet'(list)(S.empty)
toSet' (first : rest) set = toSet'(rest)(S.insert(first)(set))
toSet' [] set = set

--map
toMap list = toMap'(list)(M.empty)
toMap' ((k, v) : rest) map = toMap'(rest)(M.insert(k)(v)(map))
toMap' [] map = map

