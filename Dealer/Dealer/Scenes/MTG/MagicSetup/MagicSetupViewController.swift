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
    
    var colorPickerData = [[MTGColor]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
extension MagicSetupViewController {
    
    private func setupColorPickers() {
        fillMTGColors()
        let colorPicker = UIPickerView()
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        player1ColorTextField.inputView = colorPicker
        player2ColorTextField.inputView = colorPicker
    }
    
    private func configureView() {
        setupColorPickers()
    }

    private func fillMTGColors() {
        for i in 0..<MTGColor.allCases.count {
            colorPickerData.append([MTGColor]())
            for color in MTGColor.allCases {
                colorPickerData[i].append(color)
            }
        }
    }
}

//MARK: - Actions
extension MagicSetupViewController {
    
    @IBAction func startButtonTapped(_ sender: Any) {
        show(storyboard: .magic, style: .overFullScreen, passedParameters: (viewModel.playerSettings, viewModel.roundNumber))
    }
    
    @IBAction func roundsValueChanged(_ sender: Any) {
        viewModel.roundNumber = MagicSetupViewModel.RoundNumber(rawValue: roundsSegControl.selectedSegmentIndex) ?? .one
    }
}

//MARK: - UIPickerViewDelegate
extension MagicSetupViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorPickerData.count
    }

       // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: colorPickerData[component][row])
    }
}

extension MagicSetupViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case magic = "Magic"
    }
}

