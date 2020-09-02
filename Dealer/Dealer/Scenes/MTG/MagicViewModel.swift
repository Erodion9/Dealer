//
//  MagicViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 31.07.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

final class MagicViewModel: BaseViewModel {
    
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
}
