import Data.Csv 
import Data.Text
data Person = Person { name :: Text , salary :: Int }
    deriving (Eq, Show)