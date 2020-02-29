//
//  MagicSetupViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 18.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class MagicSetupViewController: BaseViewController {
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var roundsSegControl: UISegmentedControl!
    @IBOutlet private weak var player1ColorTextField: UITextField!
    @IBOutlet private weak var player1NameTextField: UITextField!
    @IBOutlet private weak var player1StartHPTextField: UITextField!
    @IBOutlet private weak var player2ColorTextField: UITextField!
    @IBOutlet private weak var player2NameTextField: UITextField!
    @IBOutlet private weak var player2StartHPTextField: UITextField!
    
    private var viewModel = MagicSetupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: - Actions
extension MagicSetupViewController {
    
    @IBAction func startButtonTapped(_ sender: Any) {
        show(storyboard: .magic, style: .overFullScreen, passedParameters: (viewModel.playerSettings, viewModel.roundNumber))
    }
    
    @IBAction func roundsValueChanged(_ sender: Any) {
        viewModel.roundNumber = MagicSetupViewModel.RoundNumber(rawValue: roundsSegControl.selectedSegmentIndex) ?? .one
        print(viewModel.roundNumber)
    }
}

extension MagicSetupViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case magic = "Magic"
    }
}

