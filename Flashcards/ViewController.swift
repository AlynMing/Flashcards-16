//
//  ViewController.swift
//  Flashcards
//
//  Created by Jessica Izumi on 2/15/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia")
        
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
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self 
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        //frontLabel.text = flashcard.question
        //backLabel.text = flashcard.answer
        
        //Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        //Logging to console
        print("Added new flashcard!")
        
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        //Update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabels()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
    }
    
    func updateNextPrevButtons() {
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        //Disable prev button if at the end
        if currentIndex == flashcards.count - 1 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        // Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
}

