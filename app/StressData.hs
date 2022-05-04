{-# LANGUAGE DeriveGeneric #-}
module StressData where
    import qualified Data.Vector as V
    import qualified Data.ByteString.Lazy as BL
    import Data.Csv
    import Control.Monad (mzero)
    import GHC.Generics (Generic)
    data Dataset = Dataset {
                     -- | 
                     id :: !Int,
                     -- | 
                     subreddit :: !String,
                     -- | 
                     text :: !String,
                     -- | 
                     label :: !Int
    } deriving (Generic, Show, Eq)

    instance FromRecord Dataset where
    parseRecord xs
        | length xs == 4 = Dataset <$> (xs .! 0) <*> (xs .! 1)  <*> (xs .!2) <*> (xs .!3)
        | otherwise      = mzero


