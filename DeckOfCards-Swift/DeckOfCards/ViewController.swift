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
        let size = deck.size
        for i in 0..<size {
            print("Dealt: \(deck.dealOne()!.description). \(i+1) card(s) dealt. \(deck.size) remaining.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

