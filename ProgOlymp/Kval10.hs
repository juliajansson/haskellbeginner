cube :: Int -> [Int]
cube 1 = []
cube a = head [ [b,c,d] | b<-[1..a], c<-[1..a], d<-[1..a], a^3==b^3+c^3+d^3]

kub :: Int -> [[Int]]
kub 0 = [[]]
kub s = concatMap (\t -> map (t:) (kub (s-t^3))) förstatalet
  where förstatalet=reverse (takeWhile ((<=s).(^3)) [1..])

kub2:: Int -> Int -> [[Int]]
kub2 m 0 = [[]]
kub2 0 s = []
kub2 m s = concatMap (\t -> map (t:) (kub2 (m-1) (s-t^3))) förstatalet
  where förstatalet = reverse (takeWhile ((<=s).(^3)) [1..])

topp n = head (dropWhile ((<=1).length) (concatMap (\i -> kub2 i (n^3)) [1..]))

main = do
   n <- readLn
   print (topp n)
