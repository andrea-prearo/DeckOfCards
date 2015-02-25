//
//  Card.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import Foundation

private let suitNames: Array = [
    "Clubs",
    "Diamonds",
    "Hearts",
    "Spades"
]

private let rankNames: Array = [
    "Ace",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Jack",
    "Queen",
    "King"
]

let numberOfSuits = 4;
let numberOfRanks = 13;

enum Suit: Int {
    case
        Clubs = 0,
        Diamonds,
        Hearts,
        Spades
}

enum Rank: Int {
    case
        Ace = 0,
        Two,
        Three,
        Four,
        Five,
        Six,
        Seven,
        Eight,
        Nine,
        Ten,
        Jack,
        Queen,
        King
}

class Card {
    var suit: Suit?
    var rank: Rank?

    init(suit: Suit?, rank: Rank?) {
        self.suit = suit
        self.rank = rank
    }
    
    init() {
        self.suit = nil
        self.rank = nil
    }

    func getSuitName(suit: Suit?) -> String {
        switch suit {
        case let x where x == nil:
            return "Invalid suit"
        default:
            return suitNames[suit!.rawValue]
        }
    }

    func getRankName(rank: Rank?) -> String {
        switch rank {
        case let x where x == nil:
            return "Invalid rank"
        default:
            return rankNames[rank!.rawValue]
        }
    }

    var description: String {
        return "\(getRankName(self.rank)) of \(getSuitName(self.suit))"
    }
}

extension Card : Equatable {}

func ==(lhs: Card, rhs: Card) -> Bool {
    return ((lhs.suit == rhs.suit) && (lhs.rank == rhs.rank))
}
