--rev0, rev1, rev2, rev3,
 reverse :: [a] -> [a]
--rev0 [] = []

--rev1 (x:xs) = klistra (rev0 xs) [x]

--rev2 (x:xs) = klistra (rev1 xs) [x]

--rev3 (x:xs) = klistra (rev2 xs) [x]
reverse [] = []
reverse (x:xs) = let ys = reverse xs
                 in klistra ys [x]

klistra :: [a] -> [a] -> [a]
klistra [] xs = xs
klistra (y:ys) xs = y : klistra ys xs
