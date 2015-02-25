import Game
import Control.Monad.Writer

main :: IO ()
main = mapM_ putStrLn $ snd $ runWriter playGame

playWithDeck :: IO ()
playWithDeck = mapM_ putStrLn $ snd $ runWriter $ playGameRounds 10
