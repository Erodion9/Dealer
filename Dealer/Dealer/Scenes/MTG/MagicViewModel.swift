//
//  MagicViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 31.07.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class MagicViewModel: MatchViewModel {
    
    enum Change {
        case reloadLife(Void)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    var matchData = MatchData(matchType: .magic)
    
    func incrementLife(isPlayer1: Bool) {
        if isPlayer1 {
            matchData.lifePoints.player1 += 1
        } else {
            matchData.lifePoints.player2 += 1
        }
        stateChangeHandler?(.reloadLife(Void()))
    }
    
    func decrementLife(isPlayer1: Bool) {
        if isPlayer1 {
            matchData.lifePoints.player1 -= 1
        } else {
            matchData.lifePoints.player2 -= 1
        }
        stateChangeHandler?(.reloadLife(Void()))
    }
    
    func getMatchData() -> MatchData {
        return matchData
    }
    
    func getGradientColors(isPlayer1: Bool) -> [CGColor] {
        if isPlayer1 {
            return [matchData.colors.player1.primary.getColor(),
                    matchData.colors.player1.secondary.getColor()]
        } else {
            return [matchData.colors.player2.primary.getColor(),
                    matchData.colors.player2.secondary.getColor()]
        }

    }
}
