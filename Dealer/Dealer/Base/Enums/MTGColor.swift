//
//  MTGColor.swift
//  Dealer
//
//  Created by Deniz Mavi on 24.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

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
}
