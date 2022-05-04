module Main where
import StressData (StressData)
import Data.Vector as V
import Data.Csv
import Data.ByteString.Lazy as BL
main :: IO ()
main = do
    f <- BL.readFile "testdata.txt"
    decode NoHeader f :: Either String (Vector StressData)
