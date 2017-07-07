module Deck
( maxDeckSize
, fisherYates
, Deck(..)
, mkDeck
, shuffle
, Deck.size
, dealOne
, getCard
) where

import Card
import Control.Applicative
import System.Random
import Data.Map

maxDeckSize :: Int
maxDeckSize = 52

fisherYatesStep :: RandomGen g => (Map Int a, g) -> (Int, a) -> (Map Int a, g)
fisherYatesStep (m, gen) (i, x) = ((insert j x . insert i (m ! j)) m, gen')
  where
    (j, gen') = randomR (0, i) gen

fisherYates :: RandomGen g => g -> [a] -> ([a], g)
fisherYates gen [] = ([], gen)
fisherYates gen l =
  toElems $ Prelude.foldl fisherYatesStep (initial (head l) gen) (numerate (tail l))
  where
    toElems (x, y) = (elems x, y)
    numerate = zip [1..]
    initial x gen = (singleton 0 x, gen)

data Deck = Deck { cards :: [Card] }
            deriving (Show)

mkDeck :: Deck
mkDeck = Deck { cards = (\x y -> Card x y) <$> [Clubs .. Spades] <*> [Ace .. King] }

shuffle :: Deck -> Deck
shuffle deck = Deck { cards = fst $ fisherYates (mkStdGen maxDeckSize) (cards deck) }

size :: Deck -> Int
size deck = length $ cards deck

dealOne :: Deck -> (Deck, Maybe Card)
dealOne deck | (Deck.size deck == 0) = (deck, Nothing)
             | otherwise = (deck', Just card)
             where
              card =  head $ cards deck
              deck' = Deck { cards = tail $ cards deck }

getCard :: Deck -> Int -> Maybe Card
getCard deck n | n < 0 = Nothing
               | n > (maxDeckSize-1) = Nothing
               | otherwise = Just $ (cards deck) !! n
