//
//  YGOViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

final class YGOViewModel: MatchViewModel {
    
    private enum Constants {
        
        static let incrementAmount: Int = 100
    }
    
    enum Change {
        case reloadLife(Void)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    var matchData = MatchData(matchType: .ygo)
    
    func incrementLife(isPlayer1: Bool) {
        if isPlayer1 {
            matchData.lifePoints.player1 += Constants.incrementAmount
        } else {
            matchData.lifePoints.player2 += Constants.incrementAmount
        }
        stateChangeHandler?(.reloadLife(Void()))
    }
    
    func decrementLife(isPlayer1: Bool) {
        if isPlayer1 {
            matchData.lifePoints.player1 -= Constants.incrementAmount
        } else {
            matchData.lifePoints.player2 -= Constants.incrementAmount
        }
        stateChangeHandler?(.reloadLife(Void()))
    }
    
    func getMatchData() -> MatchData {
        return matchData
    }
}
