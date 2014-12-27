tidtabell :: (Int) -> [Int]
tidtabell x | x < 1 = error "x är för litet"
            | x > 1439 = []
            | otherwise = x:tidtabell2 x x
tidtabell2 :: Int -> Int -> [Int]
tidtabell2 x k 
            | k+x > 1439 = []
            | otherwise = (k+x):tidtabell2 x (k+x)


tidtabeller :: Int -> Int -> ([Int],[Int])
tidtabeller m n = (tidtabell m, tidtabell n)

-- antal True (t1, t2)  betyder växlingar om t1 för börja annars t2 börjar 
antal :: Bool -> ([Int],[Int])->Int
antal True  (t1:t1s, t2:t2s) | t1 <  t2 =     antal True  (   t1s, t2:t2s)
                             | t1 == t2 = 1 + antal False (   t1s,    t2s)
                             | t1 >  t2 = 1 + antal False (t1:t1s,    t2s)
antal False (t1:t1s, t2:t2s) | t1 <  t2 = 1 + antal True  (   t1s, t2:t2s)
                             | t1 == t2 = 1 + antal True  (   t1s,    t2s)
                             | t1 >  t2 =     antal False (t1:t1s,    t2s)
antal True  (t1:t1s,  []) = 0
antal False (t1:t1s,  []) = 1
antal True  ([], t2:t2s)  = 1
antal False ([], t2:t2s)  = 0
antal b     ([], [])      = 0

-- först anger ifall det vänstra tåget kommer först eller inte
först :: ([Int],[Int]) -> Bool
först (t1:_,t2:_) = t1<t2
först (t1:_,[])   = True
först ([],t2:_)   = False
först ([],[])     = True -- valfritt svar

växlingar :: Int -> Int -> Int
växlingar m n = let p = tidtabeller m n
                in antal (först p) p
