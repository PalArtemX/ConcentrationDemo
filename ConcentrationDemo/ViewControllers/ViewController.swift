//
//  ViewController.swift
//  ConcentrationDemo
//
//  Created by Artem Paliutin on 12/07/2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairCards: numberOfPairsOfCards)
    var emojiChoices = ["🎃", "👻", "🤡", "👽", "🤠", "😎", "🐔", "⛄️", "🌏", "🍄", "🐖", "🐤", "👜", "🤔", "😀"]
    var emoji: [Int:String] = [:]
    
    var numberOfPairsOfCards: Int {
        (cardButtons.count + 1) / 2
    }
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0 {
                let randomIndex = arc4random_uniform(UInt32(emojiChoices.count))
                emoji[card.id] = emojiChoices.remove(at: Int(randomIndex))
        }
        
        return emoji[card.id] ?? "?"
        
        
    }
    
}

