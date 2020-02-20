//
//  ViewController.swift
//  Flashcards
//
//  Created by Jessica Izumi on 2/15/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frontLabel.isHidden = false
        backLabel.isHidden = true
        
        card.layer.cornerRadius = 20.0
        card.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if (frontLabel.isHidden) {
            frontLabel.isHidden = false
            backLabel.isHidden = true
        }
        else {
            frontLabel.isHidden = true
            backLabel.isHidden = false
        }
    }
    
}

