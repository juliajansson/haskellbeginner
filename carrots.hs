main = do
  as<-getLine
  bs<-mapM readLn [1..(head (words as))]
  putStrLn (concat (drop 1 (words as)))

--IO problems
