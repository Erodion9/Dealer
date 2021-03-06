//
//  MatchData.swift
//  Dealer
//
//  Created by Deniz Mavi on 31.07.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

struct MatchData {
    
    enum MatchType {
        case magic
        case ygo
    }
    
    enum MTGColor: CaseIterable {
        
        case blue
        case red
        case white
        case green
        case black
        
        func getEmoji() -> String {
            switch self {
            case .blue:
                return "🟦"
            case .red:
                return "🟥"
            case .white:
                return "⬜️"
            case .green:
                return "🟩"
            case .black:
                return "⬛️"
            }
        }
        
        func getColor() -> CGColor {
            switch self {
            case .blue:
                return UIColor.blue.cgColor
            case .red:
                return UIColor.red.cgColor
            case .white:
                return UIColor.white.cgColor
            case .green:
                return UIColor.green.cgColor
            case .black:
                return UIColor.black.cgColor
            }
        }
    }

    struct ColorPair {
        
        var primary: MTGColor
        var secondary: MTGColor
    }
    
    enum RoundNumber: Int {

        case one
        case three
        case five
    }

    var roundNumber: RoundNumber = .one
    var colors: (player1: ColorPair, player2: ColorPair) = (player1: ColorPair(primary: .blue,
                                                                               secondary: .red),
                                                            player2: ColorPair(primary: .white,
                                                                               secondary: .red))
    var playerNames: (player1: String, player2: String) = (player1: "Player1", player2: "Player2")
    var lifePoints: (player1: Int, player2: Int) = (player1: 20, player2: 20)

    init(matchType: MatchType) {
        switch matchType {
        case .magic:
            lifePoints = (player1: 20, player2: 20)
        case .ygo:
            lifePoints = (player1: 8000, player2: 8000)
        }
    }
}
