{-# LANGUAGE DeriveGeneric,
OverloadedStrings #-}

import Control.Applicative
import Data.Map
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
import Data.List
import GHC.Generics (Generic)
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
countWords :: [String] -> [(String,Int)]
countWords xs = Prelude.map (\w -> (head w, length w)) $ group $ sort xs
main :: IO ()
main = do
    csvData <- BL.readFile "data/reddit_stress_data.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p -> do
            let my_words = words (text p)
            let countFrequencies = countWords my_words
            putStrLn $ subreddit p ++ show countFrequencies