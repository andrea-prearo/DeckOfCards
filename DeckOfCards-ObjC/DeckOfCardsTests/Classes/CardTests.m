//
//  CardTests.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Card.h"

@interface CardTests : XCTestCase

@end

@implementation CardTests

- (void)setUp
{
	[super setUp];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testInvalidCard
{
	XCTAssertThrowsSpecificNamed([[Card alloc] init], NSException, @"InvalidCardException",
															 @"A card needs to specify a suit and a rank");
}

- (void)testSuitCount
{
	XCTAssertTrue(numberOfSuits == 4, @"A card must define 4 possible suits");
}

- (void)testInvalidSuit
{
	XCTAssertThrowsSpecificNamed([[Card alloc] initWithSuit:-1 andRank:five], NSException,
															 @"InvalidCardException", @"Invalid suit");
	XCTAssertThrowsSpecificNamed([[Card alloc] initWithSuit:numberOfSuits andRank:five], NSException,
															 @"InvalidCardException", @"Invalid suit");
}

- (void)testRankCount
{
	XCTAssertTrue(numberOfRanks == 13, @"A card must define 13 possible ranks");
}

- (void)testInvalidRank
{
	XCTAssertThrowsSpecificNamed([[Card alloc] initWithSuit:clubs andRank:-1], NSException,
															 @"InvalidCardException", @"Invalid rank");
	XCTAssertThrowsSpecificNamed([[Card alloc] initWithSuit:clubs andRank:numberOfRanks], NSException,
															 @"InvalidCardException", @"Invalid rank");
}

@end
