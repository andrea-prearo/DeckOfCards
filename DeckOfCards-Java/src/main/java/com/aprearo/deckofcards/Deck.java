package com.aprearo.deckofcards;

import java.util.ArrayList;

public class Deck {
    private ArrayList<Card> cards;

    public Deck() {
        cards = new ArrayList<>();
        for (Card.Suit suit : Card.Suit.values()) {
            for (Card.Rank rank : Card.Rank.values()) {
                cards.add(new Card(suit, rank));
            }
        }
    }

    public ArrayList<Card> getCards() {
        return cards;
    }


    public int size() {
        return  cards.size();
    }

    public void shuffle() {
        // Implementation of Fisher–Yates shuffle algorithm
        // http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

        int n = cards.size();
        for (int i = 0; i < n; i++) {
            int random = i + (int) (Math.random() * (n - i));
            Card randomCard = cards.get(random);
            cards.set(random, cards.get(i));
            cards.set(i, randomCard);
        }
    }

    public Card dealOne() {
        if (size() == 0) {
            throw new RuntimeException("All cards have been dealt");
        }
        Card card = cards.remove(0);
        return card;
    }

    public Card getCard(int index) {
        if (index < 0 || index >= cards.size()) {
            throw new RuntimeException(String.format("Card index not contained in deck: ", index));
        }
        return cards.get(index);
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        int size = size();
        for (int i = 0; i < size; i ++) {
            Card card = cards.get(i);
            builder.append(String.format("Card %d of %d: %s\n", i, size, card.toString()));
        }
        return builder.toString();
    }
}
