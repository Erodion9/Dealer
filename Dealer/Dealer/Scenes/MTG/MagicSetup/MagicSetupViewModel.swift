//
//  MagicSetupViewModel.swift
//  Dealer
//
//  Created by Deniz Mavi on 24.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

final class MagicSetupViewModel: BaseViewModel {
    
    private enum Constants {
        
        static let defaultHP: Int = 20
    }
    
    enum RoundNumber: Int {

        case one
        case three
        case five
    }
    
    enum Field {
        
        case color
        case name
        case startHP
    }
    
    private(set) var playerSettings = (PlayerSetting(selectedColor: (.white, .blue), name: "Player 1", startHP: 20),
                                  PlayerSetting(selectedColor: (.black, .red), name: "Player 2", startHP: 20))
    
    var roundNumber: RoundNumber = .one
    
    func updatePlayerSettings(isPlayer1: Bool, field: Field, data: Any) {
        switch field {
        case .color:
            if let color = data as? (primary: MTGColor, secondary: MTGColor) {
                isPlayer1 ? (playerSettings.0.selectedColor = color) : (playerSettings.1.selectedColor = color)
            }
        case .name:
            if let name = data as? String {
                isPlayer1 ? (playerSettings.0.name = name) : (playerSettings.1.name = name)
            }
        case .startHP:
            if let startHP = data as? Int {
                isPlayer1 ? (playerSettings.0.startHP = startHP) : (playerSettings.1.startHP = startHP)
            }
        }
    }
}
