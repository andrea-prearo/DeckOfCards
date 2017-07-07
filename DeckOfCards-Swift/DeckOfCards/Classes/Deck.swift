//
//  Deck.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import Foundation

open class Deck {
    var size: Int {
        get { return self.cards.count }
    }
    var cards: Array<Card>

    init() {
        self.cards = []
        for suit in 0..<numberOfSuits {
            for rank in 0..<numberOfRanks {
                cards.append(Card(suit: Suit(rawValue: suit)!, rank: Rank(rawValue: rank)!))
            }
        }
    }

    func shuffle() {
        // Implementation of Fisher–Yates shuffle algorithm
        // http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
        
        let count = self.size
        var j = 0
        for i in (1..<count).reversed() {
            j = Int(arc4random_uniform(UInt32(i + 1)))
            (cards[j], cards[i]) = (cards[i], cards[j])
        }
    }

    func dealOne() -> Card? {
        switch self.size {
        case let x where x == 0:
            return nil
        default:
            let index = 0
            let card = self.cards[index]
            self.cards.remove(at: index)
            return card
        }
    }

    func getCard(_ index: Int) -> Card? {
        switch index {
        case let x where (1...self.size) ~= x:
            return self.cards[index]
        default:
            return nil
        }
    }

    var description: String {
        var descr = ""
        let size = self.size
        for (index, card) in self.cards.enumerated() {
            descr += "Card \(index) of \(size): \(card.description)"
        }
        return descr
    }
}
