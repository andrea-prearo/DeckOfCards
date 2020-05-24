//
//  ViewController.m
//  DeckOfCards
//
//  Created by Andrea Prearo on 7/15/16.
//
//

#import "ViewController.h"
#import "Deck.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Deck *deck = [Deck create];
    NSLog(@"New deck ready.");
    [deck shuffle];
    NSLog(@"Shuffled deck.");
    NSUInteger size = deck.size;
    for (int i = 0; i < size; i++) {
        NSLog(@"Dealt: %@. %lu card(s) dealt. %d remaining.", [deck dealOne],
              i+1, deck.size);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
