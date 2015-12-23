
{-
dropNotSame::[String]->[String]->[String]
dropNotSame [] []=[]
dropNotSame [] _ =[]
dropNotSame _  []=[]
dropNotSame [a:as] [b:bs]=[xs|xs<-cs,
      where cs=[a:as]++[b:bs]

hitta::String->[String]->Int
hitta [] _=0
hitta _ []=0
hitta as bs=length ([xs|xs<-ps]
  where ps=permutations as

makewords::String->[String]
makewords []=[]
makewords xs=[(x:makewords xs

special::[String]->[String]
special []=[]
special ((x:xs):xss)=((x:(concat (special xss))):(permutations xs):(special (concat xss)))

heads::[String]->String
heads []=[]
heads (xs:xss)=((head xs):(heads xss))

convert:: [String]->[Int]
convert []=[]
convert (x:xs)=((read x):(convert xs))

scrabble::[String]->[String]
scrabble []=[]
scrabble (as:bs:[])=scrabble2 as bs
scrabble (as:bs:bss)=scrabble1 (scrabble2 as bs) (head bss)

scrabble1::[String]->String->[String]
scrabble1 [] []=[]
scrabble1 (as:bs:[]) cs=(scrabble2 as bs)++(scrabble2 bs cs)
scrabble1 (as:ass) bs=((scrabble2 as bs)++(scrabble1 ass bs))

scrabble2::String->String->[String]
scrabble2 [] []=[]
scrabble2 as bs=[(x:xs)|x<-cs, xs<-ds]
         where cs=as++bs
               ds=(svansar (permutations bs))++(svansar (permutations as))

-}
