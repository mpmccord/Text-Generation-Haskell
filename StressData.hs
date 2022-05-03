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

instance FromNamedRecord StressData where
  parseNamedRecord record =
    Stock
      <$> record .: "id"
      <*> record .: "subreddit"
      <*> record .: "text"
      <*> record .: "label"
main :: IO ()
main = do
    contents <- readFile "/Users/melaniemccord/Desktop/Github/Functional_Programming/final_project/test_data.txt"
    let word_contents = wordsWhen (==',') contents
    let first word_contents = read (first word_contents) :: Int
    print $ StressData word_contents