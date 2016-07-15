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
        self.deck = Deck()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShuffle() {
        let cards1 = self.deck?.remainingCards
        self.deck?.shuffle()
        let cards2 = self.deck?.remainingCards
        XCTAssertFalse(cards1! == cards2!, "Deck has not been shuffled")
    }

    func testDealOne() {
        let len0 = self.deck?.size
        let card1 = self.deck?.dealOne()
        let len1 = self.deck?.size
        let card2 = self.deck?.dealOne()
        let len2 = self.deck?.size
        XCTAssertFalse(card1 == card2, "Deck has not been shuffled")
        XCTAssertEqual(len0! - len1!, 1, "Dealt card has not been removed from the deck")
        XCTAssertEqual(len1! - len2!, 1, "Dealt card has not been removed from the deck")
    }

    func testNoMoreCards() {
        for _ in 1 ... self.deck!.size {
            self.deck?.dealOne()
        }
        let card = self.deck?.dealOne()
        XCTAssertTrue(card == nil, "There are still cards in the deck")
    }

    func testSameCard() {
        let card1 = self.deck?.getCard(1)
        let card2 = self.deck?.getCard(1)
        XCTAssertTrue(card1 == card2, "Cards are different")
        let card3 = Card(suit: card1?.suit, rank: card1?.rank)
        XCTAssertTrue(card1 == card3, "Cards are different")
    }
    
    func testDifferentCard() {
        let card1 = self.deck?.getCard(1)
        let card2 = self.deck?.getCard(2)
        XCTAssertFalse(card1 == card2, "Cards are the same")
    }
}