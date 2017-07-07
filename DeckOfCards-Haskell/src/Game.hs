module Game
( GameState(..)
, playGame
, playGameRounds
) where

import Card
import Deck
import Control.Monad.Writer
import Data.Maybe

data GameState = GameState { deck :: Deck, card :: Maybe Card }

instance Show GameState where
   show (GameState deck card) | (size deck == 0) = show $ "Dealt: " ++ (show $ fromJust card) ++ ". " ++ "All cards have been dealt."
                              | otherwise = show $ "Dealt: " ++ (show $ fromJust card) ++ ". " ++ (show (subtract (size deck) maxDeckSize)) ++ " card(s) dealt. " ++ (show (size deck)) ++" remaining."

initGameState :: GameState
initGameState = GameState {
                  deck = shuffle mkDeck,
                  card = Nothing
                }

playRound :: GameState -> GameState
playRound gameState = GameState {
                        deck = deck',
                        card = card'
                      }
                      where
                        (deck', card') = dealOne (deck gameState)

playRounds :: Int -> GameState -> Writer [String] GameState
playRounds n gameState | (n == 0) = do
                        return gameState'
                       | ((size $ deck gameState) == 0) = do
                        return gameState'
                       | otherwise = do
                        tell [show gameState']
                        playRounds (n-1) gameState'
                      where gameState' = playRound gameState

playGame :: Writer [String] GameState
playGame = playRounds maxDeckSize initGameState

playGameRounds :: Int -> Writer [String] GameState
playGameRounds n = playRounds n initGameState
