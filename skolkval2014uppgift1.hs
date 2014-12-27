bsort :: [Int]->(Int,[Int])
bsort [] = (0,[])
bsort (x:xs) = let (n, ys) = bsort xs
                   (m, zs) = bins x ys
               in (n+m,zs)             
bins :: (Int)->[Int]->(Int,[Int])
bins x [] = (0, [x])
bins y (x:xs) = if y <= x then (0,y:x:xs)
                else let (n,ys) = bins y xs
                     in (n+1,x:ys)
b :: (Int,[Int])->(Int)
b (n,_) = n

solution :: [Int]->(Int)
solution = b . bsort
