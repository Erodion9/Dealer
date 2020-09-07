//
//  YGOViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class YGOViewController: MatchViewController, UINavigationControllerDelegate {
    
    @IBOutlet private weak var player2View: UIView!
    @IBOutlet private weak var player2ToolbarView: UIView!
    @IBOutlet private weak var player2ToolbarLifeView: UILabel!
    @IBOutlet private weak var player1ToolbarNameLabel: UILabel!
    @IBOutlet private weak var player2ToolbarNameLabel: UILabel!
    @IBOutlet private weak var player1ToolbarLifeView: UILabel!
    @IBOutlet private weak var player1LifeTextField: UITextField!
    @IBOutlet private weak var player2LifeTextField: UITextField!
    @IBOutlet private weak var player1PictureButton: UIButton!
    @IBOutlet private weak var player2PictureButton: UIButton!
    
    private var imagePicker = UIImagePickerController()
    private var viewModel = YGOViewModel()
    private var player1PicturePressed = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPassedParameters()
        configureView()
        reloadLifeData()
    }
}

//MARK: - View Configuration
extension YGOViewController {
    
    private func configureView() {
        //Todo: Move state change handling to BaseViewController and Model
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        flipElements()
        setPlayerNames()
    }
    
    private func flipElements() {
        player2View.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2ToolbarView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player1PictureButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2PictureButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        player1LifeTextField.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                player2LifeTextField.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    private func setPlayerNames() {
        player1ToolbarNameLabel.text = viewModel.getMatchData().playerNames.player1
        player2ToolbarNameLabel.text = viewModel.getMatchData().playerNames.player2
    }
    
    private func reloadLifeData() {
        player1LifeTextField.text = String(viewModel.getMatchData().lifePoints.player1)
        player1ToolbarLifeView.text = String(viewModel.getMatchData().lifePoints.player1)
        player2LifeTextField.text = String(viewModel.getMatchData().lifePoints.player2)
        player2ToolbarLifeView.text = String(viewModel.getMatchData().lifePoints.player2)
    }
    
    private func getPassedParameters() {
        guard let matchData = passedParameters as? MatchData else { return }
        viewModel.matchData = matchData
    }
}

//MARK: - Actions
private extension YGOViewController {

    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        viewModel.incrementLife(isPlayer1: sender.tag == 0)
    }
    
    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        viewModel.decrementLife(isPlayer1: sender.tag == 0)
    }
    
    @IBAction func pictureButtonTapped(_ sender: UIButton) {
        ImagePickerManager().pickImage(self) { (image) in
            let resizedImage = self.resizeImage(image: image, targetSize: sender.frame.size)
            sender.setImage(resizedImage, for: .normal)
        }
    }
    
    @IBAction func diceButtonTapped(_ sender: Any) {
        show(storyboard: .dice, style: .formSheet, passedParameters: nil)
    }
    
    @IBAction func coinButtonTapped(_ sender: Any) {
        show(storyboard: .coin, style: .formSheet, passedParameters: nil)
    }
    
    @IBAction func lifeTextFieldTapped(_ sender: UITextField) {
        sender.selectedTextRange = sender.textRange(from: sender.beginningOfDocument, to: sender.endOfDocument)
    }
}

// MARK: - State Change Handling
private extension YGOViewController {

    func apply(change: YGOViewModel.Change) {
        switch change {
        case .reloadLife():
            reloadLifeData()
            break
        }
    }
}
