//
//  DeckTests.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Deck.h"
#import "Card.h"

@interface DeckTests : XCTestCase

@property (nonatomic, retain) Deck *deck;

@end

@implementation DeckTests : XCTestCase

@synthesize deck = _deck;

- (void)setUp
{
	[super setUp];
	
	_deck = [Deck create];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testShuffle
{
	NSArray *cards1 = [self.deck.remainingCards copy];
	[self.deck shuffle];
	NSArray *cards2 = [self.deck.remainingCards copy];
	XCTAssertFalse([cards1 isEqualToArray:cards2], @"Deck has not been shuffled");
}

- (void)testDealOne
{
	NSUInteger len0 = self.deck.size;
	Card *card1 = [self.deck dealOne];
	NSUInteger len1 = self.deck.size;
	Card *card2 = [self.deck dealOne];
	NSUInteger len2 = self.deck.size;
	XCTAssertFalse([card1 isEqual:card2], @"Card has already been dealt");
	XCTAssertTrue(len0 - len1 == 1, @"Dealt card has not been removed from the deck");
	XCTAssertTrue(len1 - len2 == 1, @"Dealt card has not been removed from the deck");
}

- (void)testNoMoreCards
{
	NSUInteger count = self.deck.size;
	for (NSUInteger i = 0; i < count; i++) {
		[self.deck dealOne];
	}
	XCTAssertThrowsSpecificNamed([self.deck dealOne], NSException, @"InvalidOperationException",
															 @"All cards have been dealt");
}

- (void)testSameCard
{
	Card *card1 = [self.deck getCard:0];
	Card *card2 = [self.deck getCard:0];
	XCTAssertTrue([card1 isEqual:card2], @"Cards are different");
	Card *card3 = [Card createWithSuit:card1.suit andRank:card1.rank];
	XCTAssertTrue([card1 isEqual:card3], @"Cards are different");
}

- (void)testDifferentCard
{
	Card *card1 = [self.deck getCard:0];
	Card *card2 = [self.deck getCard:1];
	XCTAssertFalse([card1 isEqual:card2], @"Cards are the same");
}

@end
