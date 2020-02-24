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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        show(storyboard: .magic, style: .overFullScreen, passedParameters: nil)
    }
    
}

extension MagicSetupViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case magic = "Magic"
    }
}

