//
//  ViewController.swift
//  ConcentrationDemo
//
//  Created by Artem Paliutin on 12/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }

    @IBAction func secondTapCard(_ sender: UIButton) {
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    
    
}

