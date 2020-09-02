//
//  YGOSetupViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 21.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

final class YGOSetupViewModel: BaseViewModel {
    
    private enum Constants {
        
        static let defaultHP: Int = 8000
        static let maxHPConstant: Int = 64
        static let hpMultiplier: Int = 250
    }
    
    enum Field {
        
        case color
        case name
        case startHP
    }
    
    private var matchData = MatchData(matchType: .ygo)
    
    func getMatchData() -> MatchData {
        return matchData
    }
    
    func setNumberOfRounds(rounds: MatchData.RoundNumber) {
        matchData.roundNumber = rounds
    }
    
    func getHPData() -> [Int] {
        var hpData = [Int]()
        for i in 1...Constants.maxHPConstant {
            hpData.append(i * Constants.hpMultiplier)
        }
        return hpData
    }
    
    func setPlayerColor(forPlayer1: Bool, isPrimary: Bool, color: MatchData.MTGColor) {
        if forPlayer1 {
            if isPrimary {
                matchData.colors.player1.primary = color
            } else {
                matchData.colors.player1.secondary = color
            }
        } else {
            if isPrimary {
                matchData.colors.player2.primary = color
            } else {
                matchData.colors.player2.secondary = color
            }
        }
    }
    
    func setLifePoints(forPlayer1: Bool, lifePoints: Int) {
        if forPlayer1 {
            matchData.lifePoints.player1 = lifePoints
        } else {
            matchData.lifePoints.player2 = lifePoints
        }
    }
    
    func setName(forPlayer1: Bool, name: String) {
        if forPlayer1 {
            matchData.playerNames.player1 = name
        } else {
            matchData.playerNames.player2 = name
        }
    }
}

