kolla :: Eq a => [a]->Int
kolla [] = 0
kolla (x:xs) | length samma > 1  = 1+kolla resten
             | otherwise         =   kolla resten
  where samma  = takeWhile (x==) (x:xs)
        resten = dropWhile (x==) (x:xs)

qsort :: Ord a=> [a]->[a]
qsort []     = []
qsort [x]    = [x]
qsort (x:xs) = mindre++(x:större)
  where mindre = qsort (filter (<=x) xs)
        större = qsort (filter (>x)  xs)

solution xs=kolla (qsort xs)
