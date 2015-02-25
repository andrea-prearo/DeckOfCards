//
//  Deck.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import Foundation

public class Deck {
    var size: Int {
        get { return self.remainingCards.count }
    }
    var remainingCards: Array<Card>
    var dealtCards: Array<Card>

    init() {
        self.dealtCards = []
        self.remainingCards = []
        for suit in 0 ... numberOfSuits - 1 {
            for rank in 0 ... numberOfRanks - 1 {
                remainingCards.append(Card(suit: Suit(rawValue: suit)!, rank: Rank(rawValue: rank)!))
            }
        }
    }

    func shuffle() {
        // Implementation of Fisher–Yates shuffle algorithm
        // http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
        
        var remainingCards = self.remainingCards
        let count = self.size
        var j = 0
        for i in reverse(1 ... count - 1) {
            j = Int(arc4random_uniform(i + 1))
            swap(&remainingCards[j], &remainingCards[i])
        }
        self.remainingCards = remainingCards
    }

    func dealOne() -> Card? {
        switch self.size {
        case let x where x == 0:
            return nil
        default:
            var index = 0
            var card = self.remainingCards[index]
            self.remainingCards.removeAtIndex(index)
            self.dealtCards.append(card)
            return card
        }
    }

    func getCard(index: Int) -> Card? {
        switch index {
        case let x where (1 ... self.size) ~= x:
            return self.remainingCards[index]
        default:
            return nil
        }
    }

    var description: String {
        var descr = ""
        let size = self.size
        for (index, card) in enumerate(self.remainingCards) {
            descr += "Card \(index) of \(size): \(card.description)"
        }
        return descr
    }
}