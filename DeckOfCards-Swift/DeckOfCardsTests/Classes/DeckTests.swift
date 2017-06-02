//
//  DeckTests.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import UIKit
import XCTest

class DeckTests: XCTestCase {
    var deck : Deck?

    override func setUp() {
        deck = Deck()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShuffle() {
        let cards1 = deck?.remainingCards
        deck?.shuffle()
        let cards2 = deck?.remainingCards
        XCTAssertNotEqual(cards1!, cards2!, "Deck has not been shuffled")
    }

    func testDealOne() {
        let len0 = deck?.size
        let card1 = deck?.dealOne()
        let len1 = deck?.size
        let card2 = deck?.dealOne()
        let len2 = deck?.size
        XCTAssertNotEqual(card1, card2, "Deck has not been shuffled")
        XCTAssertEqual(len0! - len1!, 1, "Dealt card has not been removed from the deck")
        XCTAssertEqual(len1! - len2!, 1, "Dealt card has not been removed from the deck")
    }

    func testNoMoreCards() {
        for _ in 1 ... deck!.size {
            _ = deck?.dealOne()
        }
        let card = deck?.dealOne()
        XCTAssertNil(card, "There are still cards in the deck")
    }

    func testSameCard() {
        let card1 = deck?.getCard(1)
        let card2 = deck?.getCard(1)
        XCTAssertEqual(card1, card2, "Cards are different")
        let card3 = Card(suit: card1?.suit, rank: card1?.rank)
        XCTAssertEqual(card1, card3, "Cards are different")
    }
    
    func testDifferentCard() {
        let card1 = deck?.getCard(1)
        let card2 = deck?.getCard(2)
        XCTAssertNotEqual(card1, card2, "Cards are the same")
    }
}
