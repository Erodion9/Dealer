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
    
    enum RoundNumber {

        case one
        case three
        case five
    }
    
    enum Field {
        
        case color
        case name
        case startHP
    }

    var player1Settings: PlayerSettings?
    var player2Settings: PlayerSettings?
    
    var playerSettings: (player1: PlayerSettings, player2: PlayerSettings)? {
        guard let player1Settings = player1Settings, let player2Settings = player2Settings else { return nil }
        return (player1Settings, player2Settings)
    }
    
    var roundNumber: RoundNumber = .one
    
    //Data Update
    func update(player: Bool, field: Field, data: Any) {
        
        switch field {
        case .color:
            guard let data = data as? (MTGColor, MTGColor) else { return }
            updateColor(player: player, color: data)
        case .name:
            guard let data = data as? String else { return }
            updateName(player: player, name: data)
        case .startHP:
            guard let data = data as? Int else { return }
            updateStartHP(player: player, hp: data)
        }
    }
    
    func updateColor(player: Bool, color: (MTGColor, MTGColor)) {
        if player {
            if var player1Settings = player1Settings {
                player1Settings.selectedColor = color
            } else {
                player1Settings = PlayerSettings(selectedColor: color, name: "", startHP: Constants.defaultHP)
            }
        } else {
            if var player2Settings = player2Settings {
                player2Settings.selectedColor = color
            } else {
                player2Settings = PlayerSettings(selectedColor: color, name: "", startHP: Constants.defaultHP)
            }
        }
    }
    
    func updateName(player: Bool, name: String) {
        if player {
            if var player1Settings = player1Settings {
                player1Settings.name = name
            } else {
                player1Settings = PlayerSettings(selectedColor: (.white, .white), name: name, startHP: Constants.defaultHP)
            }
        } else {
            if var player2Settings = player2Settings {
                player2Settings.name = name
            } else {
                player2Settings = PlayerSettings(selectedColor: (.white, .white), name: name, startHP: Constants.defaultHP)
            }
        }
    }
    
    func updateStartHP(player: Bool, hp: Int) {
        if player {
            if var player1Settings = player1Settings {
                player1Settings.startHP = hp
            } else {
                player1Settings = PlayerSettings(selectedColor: (.white, .white), name: "", startHP: hp)
            }
        } else {
            if var player2Settings = player2Settings {
                player2Settings.startHP = hp
            } else {
                player2Settings = PlayerSettings(selectedColor: (.white, .white), name: "", startHP: hp)
            }
        }
    }
}
