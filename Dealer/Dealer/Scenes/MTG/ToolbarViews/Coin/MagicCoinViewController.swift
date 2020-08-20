//
//  MagicCoinViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 20.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class MagicCoinViewController: BaseViewController {
    
    private enum Constants {
        
        static let coinPrefix = "Coin_"
        static let heads = "Heads"
        static let tails = "Tails"
    }
    
    @IBOutlet private weak var coinButton: UIButton!
    
    private var viewModel = MagicCoinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}

//MARK: - View Configuration
extension MagicCoinViewController {
    
    private func configureView() {
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
    }
    
    func updateCoinImage(coin: Bool) {
        coinButton.setImage(UIImage(named: Constants.coinPrefix + (coin ? Constants.heads : Constants.tails)),
                            for: .normal)
    }
}

//MARK: - Actions
extension MagicCoinViewController {

    @IBAction func coinButtonTapped(_ sender: Any) {
        viewModel.tossCoin()
    }
}

// MARK: - State Change Handling
private extension MagicCoinViewController {

    func apply(change: MagicCoinViewModel.Change) {
        switch change {
        case .updateCoinImage(coin: let coin):
            updateCoinImage(coin: coin)
            break
        }
    }
}
