check::[Int]->[Int]
check []=[]
check (x:xs)|triangel x && kvadrat x=(x:check xs)
            |otherwise              =check xs

inside::Int->[Int]->Bool
inside a []=False
inside a (b:bs)|a==b     =True
               |otherwise=inside a bs

splitAtDrop::Int->[Int]->[Int]
splitAtDrop x xs=fst(splitAt x xs)

triangel::Int->Bool
triangel a|inside a (splitAtDrop a (triangeltal [1..]))=True
          |otherwise =False

triangeltal::[Int]->[Int]
triangeltal (x:xs)=((div (x*(x+1)) 2):triangeltal xs)

kvadrat::Int->Bool
kvadrat a|inside a (splitAtDrop a (kvadrattal [1..]))=True
         |otherwise =False

kvadrattal::[Int]->[Int]
kvadrattal (x:xs)=((x*x):kvadrattal xs)

main=do
  print (check [1..])
