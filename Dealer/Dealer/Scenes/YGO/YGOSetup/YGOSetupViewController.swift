//
//  YGOSetupViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 21.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class YGOSetupViewController: BaseViewController {
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var roundsSegControl: UISegmentedControl!
    @IBOutlet private weak var player1ColorTextField: UITextField!
    @IBOutlet private weak var player1NameTextField: UITextField!
    @IBOutlet private weak var player1LifeTextField: UITextField!
    @IBOutlet private weak var player2ColorTextField: UITextField!
    @IBOutlet private weak var player2NameTextField: UITextField!
    @IBOutlet private weak var player2LifeTextField: UITextField!
    private var viewModel = YGOSetupViewModel()
    
    private var player1ColorPickerView: UIPickerView?
    private var player2ColorPickerView: UIPickerView?
    private var player1LifePickerView: UIPickerView?
    private var player2LifePickerView: UIPickerView?
    
    private var colorPickerData = [[MatchData.MTGColor]]()
    private var hpPickerData = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    @IBAction func nameTextFieldEditingChanged(_ sender: UITextField) {
    guard let name = sender.text else { return }
        viewModel.setName(forPlayer1: sender.tag == 0, name: name)
    }
}

//MARK: - View Configuration
extension YGOSetupViewController {
    
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
        
        player1ColorTextField.tintColor = UIColor.clear
        player2ColorTextField.tintColor = UIColor.clear
        
        updateColorTextBoxes()
    }
    
    private func setupLifePickers() {
        
        hpPickerData = viewModel.getHPData()
        player1LifePickerView = UIPickerView()
        player2LifePickerView = UIPickerView()
        
        player1LifePickerView?.delegate = self
        player1LifePickerView?.dataSource = self
        player2LifePickerView?.delegate = self
        player2LifePickerView?.dataSource = self
        
        player1LifeTextField.inputView = player1LifePickerView
        player2LifeTextField.inputView = player2LifePickerView
        
        player1LifeTextField.tintColor = UIColor.clear
        player2ColorTextField.tintColor = UIColor.clear
        
        updateLifeTextBoxes()
    }
    
    private func setupNameTextFields() {
        player1NameTextField.text = viewModel.getMatchData().playerNames.player1
        player2NameTextField.text = viewModel.getMatchData().playerNames.player2
    }
    
    private func configureView() {
        setupColorPickers()
        setupLifePickers()
        setupNameTextFields()
    }

    private func fillMTGColors() {
        for i in 0..<MatchData.MTGColor.allCases.count {
            colorPickerData.append([MatchData.MTGColor]())
            for color in MatchData.MTGColor.allCases {
                colorPickerData[i].append(color)
            }
        }
    }
    
    private func updateColorTextBoxes() {
        let colorData = viewModel.getMatchData().colors
        player1ColorTextField.text = colorData.player1.primary.getEmoji() + colorData.player1.secondary.getEmoji()
        player2ColorTextField.text = colorData.player2.primary.getEmoji() + colorData.player2.secondary.getEmoji()
    }
    
    private func updateLifeTextBoxes() {
        player1LifeTextField.text = String(viewModel.getMatchData().lifePoints.player1)
        player2LifeTextField.text = String(viewModel.getMatchData().lifePoints.player2)
    }

}

//MARK: - Actions
extension YGOSetupViewController {
    
    @IBAction func startButtonTapped(_ sender: Any) {
        show(storyboard: .YGO, style: .overFullScreen, passedParameters: viewModel.getMatchData())
    }
    
    @IBAction func roundsValueChanged(_ sender: Any) {
        guard let numberOfRounds = MatchData.RoundNumber(rawValue: roundsSegControl.selectedSegmentIndex) else { return }
        viewModel.setNumberOfRounds(rounds:  numberOfRounds)
    }
}

//MARK: - UIPickerViewDelegate
extension YGOSetupViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == player1ColorPickerView || pickerView == player2ColorPickerView {
            return 2
        }
        else {
            return 1
        }
    }

    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == player1ColorPickerView || pickerView == player2ColorPickerView {
            return colorPickerData.count
        }
        else {
            return hpPickerData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == player1ColorPickerView || pickerView == player2ColorPickerView {
            return colorPickerData[component][row].getEmoji()
        }
        else {
            return String(hpPickerData[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == player1ColorPickerView || pickerView == player2ColorPickerView {
            let isPrimary = component == 0
        viewModel.setPlayerColor(forPlayer1: pickerView == player1ColorPickerView, isPrimary: isPrimary, color: colorPickerData[isPrimary ? 0 : 1][row])
        updateColorTextBoxes()
        }
        else {
            viewModel.setLifePoints(forPlayer1: pickerView == player1LifePickerView, lifePoints: hpPickerData[row])
            updateLifeTextBoxes()
        }
     }
}

//MARK: - Routing
extension YGOSetupViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case YGO = "YGO"
    }
}
