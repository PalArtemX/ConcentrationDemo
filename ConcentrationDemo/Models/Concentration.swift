//
//  Concentration.swift
//  ConcentrationDemo
//
//  Created by Artem Paliutin on 13/07/2022.
//

import Foundation


class Concentration {
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    init(numberOfPairCards: Int) {
        initNumberOfPairCards(at: numberOfPairCards)
    }
    
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    private func initNumberOfPairCards(at numberOfPairCards: Int) {
        for index in 1...numberOfPairCards {
            let card = Card(id: index - 1)
            print(card)
            cards.append(card)
            cards.append(card)
        }
    }
    
}
