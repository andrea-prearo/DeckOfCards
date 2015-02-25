//
//  main.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 11/20/13.
//  Copyright (c) 2013 Andrea Prearo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Deck.h"

int main(int argc, char * argv[])
{
	@autoreleasepool {
		
		Deck *deck = [Deck create];
    NSLog(@"New deck ready.");
    [deck shuffle];
    NSLog(@"Shuffled deck.");
		for (int i = 0; i < 10; i++) {
			NSLog(@"Dealt: %@. %lu card(s) dealt. %lu remaining.", [deck dealOne],
						deck.dealtCards.count, deck.remainingCards.count);
		}
		
	  return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
