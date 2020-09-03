//
//  MagicDiceViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 18.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

final class DiceViewModel: BaseViewModel {
    
    enum Change {
        case updateDiceImage(dice: Int)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    
    func rollDice() {
        stateChangeHandler?(.updateDiceImage(dice: Int.random(in: 1...6)))
    }
}
