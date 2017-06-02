package com.aprearo.deckofcards;

import java.util.ArrayList;

public class Deck {
    private ArrayList<Card> remainingCards;
    private ArrayList<Card> dealtCards;

    public Deck() {
        remainingCards = new ArrayList<>();
        dealtCards = new ArrayList<>();
        for (Card.Suit suit : Card.Suit.values()) {
            for (Card.Rank rank : Card.Rank.values()) {
                remainingCards.add(new Card(suit, rank));
            }
        }
    }

    public ArrayList<Card> getRemainingCards() {
        return remainingCards;
    }

    public ArrayList<Card> getDealtCards() {
        return dealtCards;
    }

    public int size() {
        return  remainingCards.size();
    }

    public void shuffle() {
        // Implementation of Fisher–Yates shuffle algorithm
        // http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

        int n = remainingCards.size();
        for (int i = 0; i < n; i++) {
            int random = i + (int) (Math.random() * (n - i));
            Card randomCard = remainingCards.get(random);
            remainingCards.set(random, remainingCards.get(i));
            remainingCards.set(i, randomCard);
        }
    }

    public Card dealOne() {
        if (size() == 0) {
            throw new RuntimeException("All cards have been dealt");
        }
        Card card = remainingCards.remove(0);
        dealtCards.add(card);
        return card;
    }

    public Card getCard(int index) {
        if (index < 0 || index >= remainingCards.size()) {
            throw new RuntimeException(String.format("Card index not contained in deck: ", index));
        }
        return remainingCards.get(index);
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        int size = size();
        for (int i = 0; i < size; i ++) {
            Card card = remainingCards.get(i);
            builder.append(String.format("Card %d of %d: %s\n", i, size, card.toString()));
        }
        return builder.toString();
    }
}
