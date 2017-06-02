package com.aprearo.deckofcards;

public class Card {
    public enum Suit {
        CLUBS("Clubs"), DIAMONDS("Diamonds"), HEARTS("Hearts"), SPADES("Spades");

        private String suitName;

        Suit(String suitName) {
            this.suitName = suitName;
        }

        @Override
        public String toString() {
            return suitName;
        }
    }

    public enum Rank {
        ACE("Ace"), TWO("Two"), THREE("Three"), FOUR("Four"), FIVE("Five"), SIX("Six"), SEVEN("Seven"),
        EIGHT("Eight"), NINE("Nine"), TEN("Ten"), JACK("Jack"), QUEEN("Queen"), KING("King");

        private String rankName;

        Rank(String rankName) {
            this.rankName = rankName;
        }

        @Override
        public String toString() {
            return rankName;
        }
    }

    private Suit suit;
    private Rank rank;

    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
    }

    public Suit getSuit() {
        return suit;
    }

    public Rank getRank() {
        return rank;
    }

    @Override
    public String toString() {
        return String.format("%s of %s", rank.toString(), suit.toString());
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Card other = (Card) obj;
        return suit == other.suit && rank == other.rank;
    }
}
