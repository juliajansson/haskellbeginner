module Robber where
import Data.Char
import Data.List
konsonanter = "bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ"
ärKonsonant k = k `elem` konsonanter

-- Swedish names for some Haskell-definitioner (just for Erik)
type Bokstav = Char
type Text    = String

klistraAlla = concat
tillLiten   = toLower

-- Start of the main programme
översättEnBokstav :: Bokstav -> Text
översättEnBokstav b  | ärKonsonant b  = b : 'o' : tillLiten b : ""
                     | otherwise      = b : ""

översätt :: Text -> Text
översätt t = klistraAlla (map översättEnBokstav t)

