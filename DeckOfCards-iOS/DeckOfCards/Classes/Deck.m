//
//  Deck.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck ()

@property (nonatomic, assign) NSUInteger size;

@property (nonatomic, retain) NSMutableArray *remainingCards;
@property (nonatomic, retain) NSMutableArray *dealtCards;

@end

@implementation Deck

@synthesize remainingCards = _remainingCards;
@synthesize dealtCards = _dealtCards;

@synthesize size = _size;

#pragma mark -
#pragma mark Static methods

+ (Deck *)create {
	return [[Deck alloc] init];
}

#pragma mark -
#pragma mark Initialization methods

- (id)init {
	self = [super init];
	if (self) {
		_dealtCards = [[NSMutableArray alloc] init];
		_remainingCards = [[NSMutableArray alloc] init];
		for (int suit = 0; suit < numberOfSuits; suit++) {
			for (int rank = 0; rank < numberOfRanks; rank++) {
				[_remainingCards addObject:[Card createWithSuit:suit andRank:rank]];
			}
		}
		
		_size = _remainingCards.count;
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessor Methods

- (NSUInteger)size {
	_size = self.remainingCards.count;
	return _size;
}

#pragma mark -
#pragma mark Overridden Methods

- (NSString *)description {
	NSMutableString *descr = [NSMutableString stringWithString:@""];
	NSUInteger size = self.size;
	[self.remainingCards enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		[descr appendFormat:@"Card %lu of %lu: %@\n", idx + 1, size, (Card *)obj];
	}];
	return descr;
}

#pragma mark -
#pragma mark Public Methods

- (void)shuffle {
	// Implementation of Fisher–Yates shuffle algorithm
	// http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
	
	NSUInteger count = self.remainingCards.count;
	for (NSUInteger i = count - 1; i >= 1; i--) {
		int j = arc4random_uniform((u_int32_t)(i + 1));
		[self.remainingCards exchangeObjectAtIndex:j withObjectAtIndex:i];
	}
}

- (Card *)dealOne {
	if (self.size == 0) {
		@throw([NSException exceptionWithName:@"InvalidOperationException"
																	 reason:@"All cards have been dealt"
																 userInfo:nil]);
	}

	int index = 0;	
	Card *card = self.remainingCards[index];
	[self.remainingCards removeObjectAtIndex:index];
	[self.dealtCards addObject:card];
	self.size = self.remainingCards.count;
	
	return card;
}

- (Card *)getCard:(NSUInteger)index {
	if (!NSLocationInRange(index, NSMakeRange(0, self.size))) {
		@throw([NSException exceptionWithName:@"InvalidOperationException"
																	 reason:[NSString stringWithFormat:@"Card index not contained in deck: %ld", (long)index]
																 userInfo:nil]);
	}
	
	return self.remainingCards[index];
}

@end
