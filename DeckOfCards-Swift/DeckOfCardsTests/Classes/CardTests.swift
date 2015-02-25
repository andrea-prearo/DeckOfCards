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
        var card = Card(suit: Suit(rawValue: -100), rank: Rank(rawValue: -100))
        XCTAssertTrue(card.suit == nil, "A card should return Suit.Invalid for invalid suit values")
        XCTAssertTrue(card.rank == nil, "A card should return Rank.Invalid for invalid rank values")
    }

    func testSuitCount() {
        XCTAssertTrue(numberOfSuits == 4, "A card must define 4 possible suits")
    }

    func testRankCount() {
        XCTAssertTrue(numberOfRanks == 13, "A card must define 13 possible ranks")
    }
}
