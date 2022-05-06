{-# LANGUAGE DeriveGeneric,
OverloadedStrings #-}

import Control.Applicative
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
import Data.List
import Data.Char (toLower)
import GHC.Generics (Generic)
import Data.Random.Shuffle.Weighted

data StressData = StressData {
                    -- | 
                    id :: !Int,
                    -- | 
                    subreddit :: !String,
                    -- | 
                    text :: !String,
                    -- | 
                    label :: !Int
} deriving (Generic, Show, Eq)

instance FromNamedRecord StressData
instance ToNamedRecord StressData
instance DefaultOrdered StressData
countWords :: [String] -> [(Int,String)]
countWords xs = map (\w -> (length w, head w)) $ group $ sort xs

removePunc :: String -> String
removePunc xs = do
    let punctuation = show ",.?!-:;\"\'"
    [toLower x | x <- xs, not (x `elem` punctuation) ]


main :: IO ()
main = do
    csvData <- BL.readFile "data/reddit_stress_data.csv"
    let my_words = []
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p -> do
            -- let my_string = lowerString (text p)
            let my_string = removePunc (text p)
            let my_words = words my_string
            -- let my_words = map (\x -> filter (not . (`elem` ",.?!-:;\"\'")) x) my_words
            let countFrequencies = countWords my_words
            -- let test = weightedSample 5
            putStrLn $ show countFrequencies
        