//
//  CardTests.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import UIKit
import XCTest

class CardTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInvalidCard() {
        let card = Card(suit: Suit(rawValue: -100), rank: Rank(rawValue: -100))
        XCTAssertNil(card.suit, "A card should return Suit.Invalid for invalid suit values")
        XCTAssertNil(card.rank, "A card should return Rank.Invalid for invalid rank values")
    }

    func testSuitCount() {
        XCTAssertTrue(numberOfSuits == 4, "A card must define 4 possible suits")
    }

    func testRankCount() {
        XCTAssertTrue(numberOfRanks == 13, "A card must define 13 possible ranks")
    }

    func testEquality() {
        let card1 = Card(suit: .diamonds, rank: .queen)
        let card2 = Card(suit: .diamonds, rank: .queen)
        XCTAssertEqual(card1, card2)
        let card3 = Card(suit: .diamonds, rank: .ace)
        XCTAssertNotEqual(card1, card3)
    }
}
