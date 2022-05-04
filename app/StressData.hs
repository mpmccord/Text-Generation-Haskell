{-# LANGUAGE DeriveGeneric #-}
module StressData
    (StressData)
    where
    import qualified Data.Vector as V
    import qualified Data.ByteString.Lazy as BL
    import Data.Csv
    import Control.Monad (mzero)
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

    instance FromRecord StressData where
    parseRecord xs
        | length xs == 4 = StressData <$> (xs .! 0) <*> (xs .! 1)  <*> (xs .!2) <*> (xs .!3)
        | otherwise      = mzero
    instance ToRecord StressData where
        toRecord (StressData id' subreddit' text' label') = record [
            toField id', toField subreddit' toField text' toField label']

