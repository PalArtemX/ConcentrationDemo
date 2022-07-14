//
//  Concentration.swift
//  ConcentrationDemo
//
//  Created by Artem Paliutin on 13/07/2022.
//

import Foundation


struct Concentration {
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    init(numberOfPairCards: Int) {
        initNumberOfPairCards(at: numberOfPairCards)
    }
    
    
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    private mutating func initNumberOfPairCards(at numberOfPairCards: Int) {
        for index in 1...numberOfPairCards {
            let card = Card(id: index - 1)
            print(card)
            cards.append(card)
            cards.append(card)
        }
        cards = cards.shuffled()
    }
    
}
