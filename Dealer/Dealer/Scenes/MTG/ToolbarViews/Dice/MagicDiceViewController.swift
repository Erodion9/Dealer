//
//  MagicDiceViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 18.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class MagicDiceViewController: BaseViewController {
    
    private enum Constants {
        
        static let dicePrefix = "dice"
    }
    
    @IBOutlet weak var diceButton: UIButton!
    
    private var viewModel = MagicDiceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
extension MagicDiceViewController {
    
    private func configureView() {
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
    }
    
    func updateDiceImage(dice: Int) {
        diceButton.setImage(UIImage(named: Constants.dicePrefix + String(dice)),
                            for: .normal)
    }
}

//MARK: - Actions
extension MagicDiceViewController {

    @IBAction func diceButtonTapped(_ sender: Any) {
        viewModel.rollDice()
    }
}

// MARK: - State Change Handling
private extension MagicDiceViewController {

    func apply(change: MagicDiceViewModel.Change) {
        switch change {
        case .updateDiceImage(dice: let dice):
            updateDiceImage(dice: dice)
            break
        }
    }
}
