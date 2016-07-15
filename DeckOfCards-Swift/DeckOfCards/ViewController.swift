//
//  ViewController.swift
//  DeckOfCards
//
//  Created by Andrea Prearo on 12/30/14.
//  Copyright (c) 2014 Andrea Prearo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let deck = Deck()
        print("New deck ready.")
        deck.shuffle()
        print("Shuffled deck.")
        for _ in 1 ... 10 {
            print("Dealt: \(deck.dealOne()!.description). \(deck.dealtCards.count) card(s) dealt. \(deck.size) remaining.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

