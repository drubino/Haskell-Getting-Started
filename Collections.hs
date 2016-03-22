module Collections where 
    
import qualified Data.Set as Set
import qualified Data.Map as Map
import Data.Sequence as Seq

--Set
toSet list = toSet'(list)(Set.empty)
toSet' (first : rest) set = toSet'(rest)(Set.insert(first)(set))
toSet' [] set = set

--map
toMap list = toMap'(list)(Map.empty)
toMap' ((k, v) : rest) map = toMap'(rest)(Map.insert(k)(v)(map))
toMap' [] map = map

--Seq
toSeq list = toSeq'(list)(Seq.empty)
toSeq' (first : rest) seq = toSeq'(rest)(seq |> first)
toSeq' [] seq = seq
