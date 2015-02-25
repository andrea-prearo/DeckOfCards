module Card
( Suit(..)
, Rank(..)
, Card(..)
, mkCard
) where

data Suit = Clubs
          | Diamonds
          | Hearts
          | Spades
          deriving (Show, Eq, Ord, Bounded, Enum)

data Rank = Ace
          | Two
          | Three
          | Four
          | Five
          | Six
          | Seven
          | Eight
          | Nine
          | Ten
          | Jack
          | Queen
          | King
          deriving (Show, Eq, Ord, Bounded, Enum)

data Card = Card { suit :: Suit, rank :: Rank }
            deriving (Eq)

instance Show Card where
  show (Card suit rank) = show $ (show rank) ++ " of " ++ (show suit)

mkCard :: Suit -> Rank -> Card
mkCard s r = Card { suit = s, rank = r }
