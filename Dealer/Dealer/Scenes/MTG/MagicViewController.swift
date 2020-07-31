//
//  MagicViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 17.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//
import UIKit

final class MagicViewController: BaseViewController {
    
    @IBOutlet private weak var player2View: UIView!
    @IBOutlet private weak var player1ToolbarView: UIView!
    @IBOutlet private weak var player1LifeTextField: UITextField!
    @IBOutlet private weak var player2LifeTextField: UITextField!
    
    private var viewModel = MagicViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        configureView()
    }

}

//MARK: - View Configuration
extension MagicViewController {
    
    private func configureView() {
        flipPlayer2Elements()
    }
    
    private func flipPlayer2Elements() {
        player2View.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player1ToolbarView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    private func disableLifeTextFields() {
        player1LifeTextField.isEnabled = false
        player2LifeTextField.isEnabled = false
    }
    
    private func reloadLifeData() {
        player1LifeTextField.text = String(viewModel.getMatchData().lifePoints.player1)
        player2LifeTextField.text = String(viewModel.getMatchData().lifePoints.player2)
    }
}

//MARK: - Actions
private extension MagicViewController {

    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        viewModel.incrementLife(isPlayer1: sender.tag == 0)
    }
    
    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        viewModel.decrementLife(isPlayer1: sender.tag == 0)
    }
}

// MARK: - State Change Handling
private extension MagicViewController {

    func apply(change: MagicViewModel.Change) {
        switch change {
        case .reloadLife():
            reloadLifeData()
            break
        }
    }
}
