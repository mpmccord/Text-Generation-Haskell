import Control.Monad (mzero)
import Data.Text (Text)
import Data.Vector (Vector)

main :: IO ()
main = do
    f <- BL.readFile "testdata.txt"
    case decodeByName f of
        Left err      -> print err
        Right (_, xs) -> V.forM_ xs $ \(StressData x1 x2 x3 x4) -> print (x1, x2)
    -- 1,2
    -- 3,4