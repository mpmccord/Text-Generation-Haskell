{-# LANGUAGE DeriveGeneric #-}
module StressData
    (StressData, FromNamedRecord, ToNamedRecord, DefaultOrdered)
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

    instance FromNamedRecord StressData
    instance ToNamedRecord StressData
    instance DefaultOrdered StressData

