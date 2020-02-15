//
//  SelectionRouter.swift
//  Dealer
//
//  Created by Deniz Mavi on 15.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol SelectionRouterProtocol {
    
    /// Routing Function for transitioning to another view.
    /// - Parameters:
    ///   - context: View to be moved from.
    ///   - view: View to Move.
    func routeTo(from context: UIViewController, to view: Selection)
}

final class SelectionRouter: SelectionRouterProtocol {
    
    func getView(selection: Selection) -> BaseViewController {
        //Todo: Change returned views to actual non-base classes.
        switch selection {
        case .yugioh:
            return BaseViewController()
        case .mtg:
            return BaseViewController()
        case .pokemon:
            return BaseViewController()
        }
    }

    func routeTo(from context: UIViewController, to view: Selection) {
        context.navigationController?.pushViewController(getView(selection: view), animated: true)
    }
}
