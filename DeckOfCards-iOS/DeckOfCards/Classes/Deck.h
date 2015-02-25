//
//  Deck.h
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject

@property (nonatomic, readonly) NSUInteger size;

@property (nonatomic, retain, readonly) NSMutableArray *remainingCards;
@property (nonatomic, retain, readonly) NSMutableArray *dealtCards;

+ (Deck *)create;

- (void)shuffle;
- (Card *)dealOne;

- (Card *)getCard:(NSUInteger)index;

@end
