module Collections(
    module Data.Set
) where 
import Data.Set

--Set
toSet list = toSet'(list)(empty)
toSet' (first : rest) set = toSet'(rest)(insert(first)(set))
toSet' [] set = set
