//
//  Card.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import "Card.h"

NSUInteger const numberOfSuits = 4;
NSUInteger const numberOfRanks = 13;

@implementation Card

static NSArray *_suitNames;
static NSArray *_rankNames;

@synthesize suit = _suit;
@synthesize rank = _rank;

#pragma mark -
#pragma mark Static methods

+ (Card *)createWithSuit:(Suit)suit andRank:(Rank)rank {
	return [[Card alloc] initWithSuit:suit andRank:rank];
}

+ (NSArray *)suitNames {
	if (!_suitNames) {
		_suitNames = [NSArray arrayWithObjects:@"clubs", @"diamonds", @"hearts", @"spades", nil];
		
		if (_suitNames.count != numberOfSuits) {
			@throw([NSException exceptionWithName:@"InvalidSuitsException"
																		 reason:@"Number of suit enums and names doesn't match"
																	 userInfo:nil]);
		}
	}
	return _suitNames;
}

+ (NSArray *)rankNames {
	if (!_rankNames) {
		_rankNames = [NSArray arrayWithObjects:@"ace", @"two", @"three", @"four", @"five", @"six",
								 @"seven", @"eight", @"nine", @"ten", @"jack", @"queen", @"king", nil];
		
		if (_rankNames.count != numberOfRanks) {
			@throw([NSException exceptionWithName:@"InvalidRanksException"
																		 reason:@"Number of rank enums and names doesn't match"
																	 userInfo:nil]);
		}
	}
	return _rankNames;
}

#pragma mark -
#pragma mark Initialization methods

- (id)init {
	@throw([NSException exceptionWithName:@"InvalidCardException"
																 reason:@"A card needs to specify a suit and a rank"
															 userInfo:nil]);
	return nil;
}

- (id)initWithSuit:(Suit)suit andRank:(Rank)rank {
	self = [super init];
	if (self) {
		[self validateSuit:suit];
		[self validateRank:rank];

		_suit = suit;
		_rank = rank;
	}
	
	return self;
}

#pragma mark -
#pragma mark Private Methods

- (void)validateSuit:(Suit)suit {
	if (!NSLocationInRange(suit, NSMakeRange(0, numberOfSuits))) {
		@throw([NSException exceptionWithName:@"InvalidCardException"
																	 reason:@"Invalid suit"
																 userInfo:nil]);
	}
}

- (void)validateRank:(Rank)rank {
	if (!NSLocationInRange(rank, NSMakeRange(0, numberOfRanks))) {
		@throw([NSException exceptionWithName:@"InvalidCardException"
																	 reason:@"Invalid rank"
																 userInfo:nil]);
	}
}

- (NSString *)suitName:(NSInteger)suit {
	[self validateSuit:suit];
	
	return [[Card suitNames] objectAtIndex:suit];
}

- (NSString *)rankName:(NSInteger)rank {
	[self validateRank:rank];

	return [[Card rankNames] objectAtIndex:rank];
}

#pragma mark -
#pragma mark Accessor Methods

- (void)setSuit:(Suit)suit {
	[self validateSuit:suit];
	
	_suit = suit;
}

- (void)setRank:(Rank)rank {
	[self validateRank:rank];
	
	_rank = rank;
}

#pragma mark -
#pragma mark Overridden Methods

- (NSString *)description {
	return [NSString stringWithFormat: @"%@ of %@", [self rankName:self.rank], [self suitName:self.suit]];
}

- (BOOL)isEqual:(id)object {
	if (!object || ![object isKindOfClass:[Card class]]) {
		return NO;
	}
	
	Card *other = (Card *)object;
	if ((self.suit == other.suit) && (self.rank == other.rank)) {
		return YES;
	}
	return NO;
}

- (NSUInteger)hash {
	int prime = 31;
	int value = 1;
	value = prime * value + self.suit;
	value = prime * value + self.rank;
	return value;
}

@end
