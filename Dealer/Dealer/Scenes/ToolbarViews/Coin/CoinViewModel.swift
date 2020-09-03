//
//  MagicCoinViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 20.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

final class CoinViewModel: BaseViewModel {
    
    enum Change {
        case updateCoinImage(coin: Bool)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    
    func tossCoin() {
        stateChangeHandler?(.updateCoinImage(coin: Bool.random()))
    }
}
