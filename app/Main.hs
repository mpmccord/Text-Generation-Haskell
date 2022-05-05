{-# LANGUAGE DeriveGeneric,
OverloadedStrings #-}

import Control.Applicative
import Data.Map
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
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

main :: IO ()
main = do
    csvData <- BL.readFile "data/reddit_stress_data.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p ->
            putStrLn $ subreddit p ++ show (words (text p))