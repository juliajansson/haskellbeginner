main = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Hello " ++ name ++ "!:) I'm Julia.  How old are you?")
  age <- getLine
  putStrLn ("Nice! " ++ age ++ ". " ++ expression (read age))
  


expression age | age > 15 =  "You're older than me!"
	       | age == 15 = "We're the same age!"
	       | age < 15 = "You're younger than me!"
