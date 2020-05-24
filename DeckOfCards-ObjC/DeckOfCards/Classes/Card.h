//
//  Card.h
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
	clubs,
	diamonds,
	hearts,
	spades,
} Suit;
extern NSUInteger const numberOfSuits;

typedef enum : NSUInteger {
	ace,
	two,
	three,
	four,
	five,
	six,
	seven,
	eight,
	nine,
	ten,
	jack,
	queen,
	king,
} Rank;
extern NSUInteger const numberOfRanks;

@interface Card : NSObject

@property (nonatomic, assign) Suit suit;
@property (nonatomic, assign) Rank rank;

+ (Card *)createWithSuit:(Suit)suit andRank:(Rank)rank;

- (id)initWithSuit:(Suit)suit andRank:(Rank)rank;

@end
