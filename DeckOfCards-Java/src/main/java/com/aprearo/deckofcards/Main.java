package com.aprearo.deckofcards;

public class Main {
    public static void main(String[] args) {
        Deck deck = new Deck();
        System.out.println("New deck ready.");
        deck.shuffle();
        System.out.println("Shuffled deck.");
        int size = deck.size();
        for (int i = 0; i < size; i ++) {
            Card card = deck.dealOne();
            System.out.println(
                String.format("Dealt: %s. %d card(s) dealt. %d remaining.",
                    card.toString(), i+1, deck.size()));
        }
    }
}
