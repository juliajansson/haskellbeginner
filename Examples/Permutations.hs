module Permutations where
import Data.List(sort, permutations)
import Data.Set (Set)
import qualified Data.Set as Set

dictionaryFileName = "/etc/dictionaries-common/words"

readDictionary :: String -> IO (Set String)
readDictionary f = do  text <- readFile f
                       let words = lines text
                       let set = Set.fromList words
                       return set

main = do  
  dict <- readDictionary dictionaryFileName
  let  isWord :: String -> Bool
       isWord w = Set.member w dict

       permutationWords :: String -> [String]
       permutationWords w = filter isWord (permutations w)
    
  w <- getLine
  let  ws = permutationWords w
       sws = nub ws
       numbers = [1..]
       numberedWords = zip numbers sws
       lines = map showPair numberedWords
  mapM_ putStrLn lines


showPair :: (Int, String) -> String
showPair (i, s) = show i ++ ": " ++ s


                   
nub :: Ord a => [a] -> [a]
nub = nub' . sort

type SortedList a = [a]

nub' :: Eq a => SortedList a -> SortedList a
nub' (x:y:ys) | x == y     = nub' (y:ys)
              | otherwise  = x:y:nub' ys
nub' xs = xs
