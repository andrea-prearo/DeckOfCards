import Game
import Control.Monad.Writer

-- Entry point for Cabal
main :: IO ()
main = mapM_ putStrLn $ snd $ runWriter playGame

-- Additional function (run it from ghci)
playWithDeck :: IO ()
playWithDeck = mapM_ putStrLn $ snd $ runWriter $ playGameRounds 10
