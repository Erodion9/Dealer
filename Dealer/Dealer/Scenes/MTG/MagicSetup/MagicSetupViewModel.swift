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
    
    private(set) var playerSettings = (PlayerSetting(selectedColor: (.white, .blue), name: "Player 1", startHP: 20),
                                  PlayerSetting(selectedColor: (.black, .red), name: "Player 2", startHP: 20))
    
    private var roundNumber: RoundNumber = .one
    
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

//    private var player1Settings: PlayerSetting?
//    private var player2Settings: PlayerSetting?
//
//    var playerSettings: (player1: PlayerSetting, player2: PlayerSetting)? {
//        guard let player1Settings = player1Settings, let player2Settings = player2Settings else { return nil }
//        return (player1Settings, player2Settings)
//    }
//
//    var roundNumber: RoundNumber = .one
//
//    //Data Update
//    func update(player: Bool, field: Field, data: Any) {
//        switch field {
//        case .color:
//            guard let data = data as? (MTGColor, MTGColor) else { return }
//            updateColor(player: player, color: data)
//        case .name:
//            guard let data = data as? String else { return }
//            updateName(player: player, name: data)
//        case .startHP:
//            guard let data = data as? Int else { return }
//            updateStartHP(player: player, hp: data)
//        }
//    }
//
//    private func updateColor(player: Bool, color: (MTGColor, MTGColor)) {
//        if player {
//            if var player1Settings = player1Settings {
//                player1Settings.selectedColor = color
//            } else {
//                player1Settings = PlayerSetting(selectedColor: color, name: "", startHP: Constants.defaultHP)
//            }
//        } else {
//            if var player2Settings = player2Settings {
//                player2Settings.selectedColor = color
//            } else {
//                player2Settings = PlayerSetting(selectedColor: color, name: "", startHP: Constants.defaultHP)
//            }
//        }
//    }
//
//    private func updateName(player: Bool, name: String) {
//        if player {
//            if var player1Settings = player1Settings {
//                player1Settings.name = name
//            } else {
//                player1Settings = PlayerSetting(selectedColor: (.white, .white), name: name, startHP: Constants.defaultHP)
//            }
//        } else {
//            if var player2Settings = player2Settings {
//                player2Settings.name = name
//            } else {
//                player2Settings = PlayerSetting(selectedColor: (.white, .white), name: name, startHP: Constants.defaultHP)
//            }
//        }
//    }
//
//    private func updateStartHP(player: Bool, hp: Int) {
//        if player {
//            if var player1Settings = player1Settings {
//                player1Settings.startHP = hp
//            } else {
//                player1Settings = PlayerSetting(selectedColor: (.white, .white), name: "", startHP: hp)
//            }
//        } else {
//            if var player2Settings = player2Settings {
//                player2Settings.startHP = hp
//            } else {
//                player2Settings = PlayerSetting(selectedColor: (.white, .white), name: "", startHP: hp)
//            }
//        }
//    }
}
