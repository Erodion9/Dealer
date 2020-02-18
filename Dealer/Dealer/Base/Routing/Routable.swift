//
//  Routable.swift
//  Dealer
//
//  Created by Deniz Mavi on 17.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol Routable {
    
    associatedtype StoryboardIdentifier: RawRepresentable
}

extension Routable where Self: UIViewController, StoryboardIdentifier.RawValue == String {
    
    func show(storyboard: StoryboardIdentifier, style: UIModalPresentationStyle, passedParameters: Any) {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        
        guard let controller = storyboard.instantiateInitialViewController() as? BaseViewController else {
            return assertionFailure("Invalid controller for storyboard: \(storyboard).")
        }
        controller.modalPresentationStyle = style
        controller.passedParameters = passedParameters
        show(controller, sender: self)
    }
}
