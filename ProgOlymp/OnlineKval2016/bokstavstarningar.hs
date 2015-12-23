import Data.List
import Control.Monad
import qualified Data.Map.Strict as Map
import Data.Set (Set)
import qualified Data.Set as Set

dictionaryFileName = "/etc/dictionaries-common/words"

readDictionary :: String -> IO (Set String)
readDictionary f = do  text <- readFile f
                       let words = lines text
                       let set = Set.fromList words
                       return set
{-
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
-}

showPair :: (Int, String) -> String
showPair (i, s) = show i ++ ": " ++ s


                   
nubb :: Ord a => [a] -> [a]
nubb = nub' . sort

type SortedList a = [a]

nub' :: Eq a => SortedList a -> SortedList a
nub' (x:y:ys) | x == y     = nub' (y:ys)
              | otherwise  = x:y:nub' ys
nub' xs = xs

type Namn = String
solution :: [String] ->[String]-> Int
solution as bs|b==0     =a-c
              |a==c     =kolla bs as
              |otherwise=a+b-c
  where a=(kollaTabell (fyllTabell (gör as bs)))
        b=(kollaTabell' (fyllTabell (gör as bs)))
        c=(solution' (scrabble as))

has :: (Eq a) => [a] -> a -> Int
has [] _ = 0
has (x:xs) a
  | x == a    = 1
  | otherwise = has xs a

kolla:: Eq a=> [a]->[a]->Int
kolla [] _=0
kolla _ []=0
kolla (x:xs) ys=(has ys x)+(kolla xs ys)

solution'::[String]->Int
solution' as=kollaTabell (fyllTabell as)

type Antal = Int
type Tabell = Map.Map String Antal

fyllTabell :: [Namn] -> Tabell
fyllTabell = foldr f Map.empty
  where f n tab = Map.insertWith (+) n 1 tab

kollaTabell :: Tabell -> Int
kollaTabell = length . filter ((>1).snd) . Map.assocs

kollaTabell' :: Tabell -> Int
kollaTabell' = length . filter ((>2).snd) . Map.assocs

gör::[String]->[String]->[String]
gör as bs= (scrabble as)++(bs)
{-
dropNotSame::[String]->[String]->[String]
dropNotSame [] []=[]
dropNotSame [] _ =[]
dropNotSame _  []=[]
dropNotSame [a:as] [b:bs]=[xs|xs<-cs, sol cs]
      where cs=[a:as]++[b:bs]

-}
scrabble::[String]->[String]
scrabble []=[]
scrabble (as:[])=(as:[])
scrabble (as:bs:[])=scrabble2 as bs
scrabble (as:bs:cs:[])=scrabble1 (as:bs:[]) cs
scrabble (as:bs:cs:ds:[])=scrabbleswag (as:bs:[]) (cs:ds:[])
scrabble (as:bs:cs:ds:es:[])=scrabble5 as bs cs ds es
scrabble (as:bs:cs:ds:es:fs:[])=scrabble6 as bs cs ds es fs
scrabble (as:bs:cs:ds:es:fs:gs:[])=scrabble7 as bs cs ds es fs gs
scrabble (as:bs:cs:ds:es:fs:gs:hs:[])=scrabble8 as bs cs ds es fs gs hs
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:[])=scrabble9 as bs cs ds es fs gs hs is
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:[])=scrabble10 as bs cs ds es fs gs hs is js
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:[])=scrabble11 as bs cs ds es fs gs hs is js ks
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:ls:[])=scrabble12 as bs cs ds es fs gs hs is js ks ls
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:ls:ms:[])=scrabble13 as bs cs ds es fs gs hs is js ks ls ms

scrabble2::String->String->[String]
scrabble2 [] []=[]
scrabble2 as bs=listpermutations [(x:y:[])|x<-as, y<-bs]

scrabble1::[String]->String->[String]
scrabble1 [] []=[]
scrabble1 (as:bs:[]) cs=listpermutations [(a:b:c:[])|a<-as,b<-bs,c<-cs]

scrabbleswag::[String]->[String]->[String]
scrabbleswag [] []=[]
scrabbleswag (as:bs:[]) (cs:ds:[])=listpermutations [(a:b:c:d:[])|a<-as,b<-bs,c<-cs,d<-ds]

scrabble6::String->String->String->String->String->String->[String]
scrabble6 [] [] [] [] [] []=[]
scrabble6 as bs cs ds es fs=listpermutations [(a:b:c:d:e:f:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs]

listpermutations:: [String]->[String]
listpermutations []=[]
listpermutations (as:ass)=(permutations as)++(listpermutations ass)

selections::String->[(Char,String)]
selections [] = []
selections (x:xs) = (x, xs) : [ (y, x:ys) | (y,ys) <- selections xs ]

permute::String->[String]
permute []=[[]]
permute xs = [y:ps | (y,ys) <- selections xs, ps <- permute ys]

{-
scrabble (as:bs:cs:[])=scrabble3 as bs cs
scrabble (as:bs:cs:ds:[])=scrabble4 as bs cs ds
scrabble (as:bs:cs:ds:es:[])=scrabble5 as bs cs ds es
scrabble (as:bs:cs:ds:es:fs:[])=scrabble6 as bs cs ds es fs
scrabble (as:bs:cs:ds:es:fs:gs:[])=scrabble7 as bs cs ds es fs gs
scrabble (as:bs:cs:ds:es:fs:gs:hs:[])=scrabble8 as bs cs ds es fs gs hs
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:[])=scrabble9 as bs cs ds es fs gs hs is
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:[])=scrabble10 as bs cs ds es fs gs hs is js
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:[])=scrabble11 as bs cs ds es fs gs hs is js ks
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:ls:[])=scrabble12 as bs cs ds es fs gs hs is js ks ls
scrabble (as:bs:cs:ds:es:fs:gs:hs:is:js:ks:ls:ms:[])=scrabble13 as bs cs ds es fs gs hs is js ks ls ms

scrabble3::String->String->String->[String]
scrabble3 [] [] []=[]
scrabble3 as bs cs=[(x:y:z:[])|x<-ds,y<-ds,z<-ds]
         where ds=as++bs++cs

scrabble4::String->String->String->String->[String]
scrabble4 [] [] [] []=[]
scrabble4 as bs cs ds=[(a:b:c:d:[])|a<-es,b<-es,c<-es,d<-es]
         where es=as++bs++cs++ds
-}
scrabble5::String->String->String->String->String->[String]
scrabble5 [] [] [] [] []=[]
scrabble5 as bs cs ds es=[(a:b:c:d:e:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es]
{-
scrabble6::String->String->String->String->String->String->[String]
scrabble6 [] [] [] [] [] []=[]
scrabble6 as bs cs ds es fs=[(a:b:c:d:e:f:[])|a<-gs,b<-gs,c<-gs,d<-gs,e<-gs,f<-gs]
         where gs=as++bs++cs++ds++es
-}

scrabble7::String->String->String->String->String->String->String->[String]
scrabble7 [] [] [] [] [] [] []=[]
scrabble7 as bs cs ds es fs gs=[(a:b:c:d:e:f:g:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs]


scrabble8::String->String->String->String->String->String->String->String->[String]
scrabble8 [] [] [] [] [] [] [] []=[]
scrabble8 as bs cs ds es fs gs hs=[(a:b:c:d:e:f:g:h:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs]


scrabble9::String->String->String->String->String->String->String->String->String->[String]
scrabble9 [] [] [] [] [] [] [] [] []=[]
scrabble9 as bs cs ds es fs gs hs is=[(a:b:c:d:e:f:g:h:i:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is]

scrabble10::String->String->String->String->String->String->String->String->String->String->[String]
scrabble10 [] [] [] [] [] [] [] [] [] []=[]
scrabble10 as bs cs ds es fs gs hs is js=[(a:b:c:d:e:f:g:h:i:j:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is,j<-js]

scrabble11::String->String->String->String->String->String->String->String->String->String->String->[String]
scrabble11 [] [] [] [] [] [] [] [] [] [] []=[]
scrabble11 as bs cs ds es fs gs hs is js ks=[(a:b:c:d:e:f:g:h:i:j:k:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is,j<-js,k<-ks]

scrabble12::String->String->String->String->String->String->String->String->String->String->String->String->[String]
scrabble12 [] [] [] [] [] [] [] [] [] [] [] []=[]
scrabble12 as bs cs ds es fs gs hs is js ks ls=[(a:b:c:d:e:f:g:h:i:j:k:l:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is,j<-js,k<-ks,l<-ls]

scrabble13::String->String->String->String->String->String->String->String->String->String->String->String->String->[String]
scrabble13 [] [] [] [] [] [] [] [] [] [] [] [] []=[]
scrabble13 as bs cs ds es fs gs hs is js ks ls ms=[(a:b:c:d:e:f:g:h:i:j:k:l:m:[])|a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is,j<-js,k<-ks,l<-ls,m<-ms]

svansar::[String]->[String]
svansar []=[]
svansar (xs:xss)=((tail xs):(svansar xss))

convert:: [String]->[Int]
convert []=[]
convert (x:xs)=((read x):(convert xs))

main=do
  s<-getLine
  let [n,k,m]=convert (words s)
  as<- mapM (\_ -> getLine) [1..n]
  bs<- mapM (\_ -> getLine) [1..m]
  print (solution as bs)

