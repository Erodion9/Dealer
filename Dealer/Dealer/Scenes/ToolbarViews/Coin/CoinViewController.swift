//
//  MagicCoinViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 20.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class CoinViewController: BaseViewController {
    
    private enum Constants {
        
        static let coinPrefix = "Coin_"
        static let heads = "Heads"
        static let tails = "Tails"
    }
    
    @IBOutlet private weak var coinButton: UIButton!
    
    private var viewModel = CoinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}

//MARK: - View Configuration
extension CoinViewController {
    
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
extension CoinViewController {

    @IBAction func coinButtonTapped(_ sender: Any) {
        viewModel.tossCoin()
    }
}

// MARK: - State Change Handling
private extension CoinViewController {

    func apply(change: CoinViewModel.Change) {
        switch change {
        case .updateCoinImage(coin: let coin):
            updateCoinImage(coin: coin)
            break
        }
    }
}
