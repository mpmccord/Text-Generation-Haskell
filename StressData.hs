import System.IO
import Control.Monad

data StressData = StressData {
    id :: Int,
    subreddit :: String,
    text :: String,
    label :: Int
} deriving (Show, Eq)

wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

