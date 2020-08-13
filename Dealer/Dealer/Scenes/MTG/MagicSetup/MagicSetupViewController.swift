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
    
    private var player1ColorPickerView: UIPickerView?
    private var player2ColorPickerView: UIPickerView?
    
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
        player1ColorPickerView = UIPickerView()
        player2ColorPickerView = UIPickerView()
        
        player1ColorPickerView?.delegate = self
        player1ColorPickerView?.dataSource = self
        player2ColorPickerView?.delegate = self
        player2ColorPickerView?.dataSource = self
        
        player1ColorTextField.inputView = player1ColorPickerView
        player2ColorTextField.inputView = player2ColorPickerView
        
        updateColorTextBoxes()
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
    
    private func updateColorTextBoxes() {
        player1ColorTextField.text = viewModel.playerSettings.0.selectedColor.primary.getEmoji() + viewModel.playerSettings.0.selectedColor.secondary.getEmoji()
        player2ColorTextField.text = viewModel.playerSettings.1.selectedColor.primary.getEmoji() + viewModel.playerSettings.1.selectedColor.secondary.getEmoji()
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0 {
            viewModel.setPlayerColor(isPlayer1: pickerView == player1ColorPickerView,
                                     colors: (primary: colorPickerData[0][row],
                                              secondary: viewModel.getPlayerSettings(forPlayer1: pickerView == player1ColorPickerView).selectedColor.secondary))
        } else if component == 1 {
            viewModel.setPlayerColor(isPlayer1: pickerView == player1ColorPickerView,
                                     colors: (primary: viewModel.getPlayerSettings(forPlayer1: pickerView == player1ColorPickerView).selectedColor.primary, secondary: colorPickerData[1][row]))
        }
        updateColorTextBoxes()
         // use the row to get the selected row from the picker view
         // using the row extract the value from your datasource (array[row])
     }
}

extension MagicSetupViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case magic = "Magic"
    }
}

