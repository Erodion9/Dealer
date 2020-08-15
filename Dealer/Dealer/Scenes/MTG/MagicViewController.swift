//
//  MagicViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 17.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//
import UIKit

final class MagicViewController: BaseViewController, UINavigationControllerDelegate {
    
    @IBOutlet private weak var player2View: UIView!
    @IBOutlet private weak var player2ToolbarView: UIView!
    @IBOutlet private weak var player2ToolbarLifeView: UILabel!
    @IBOutlet private weak var player1ToolbarLifeView: UILabel!
    @IBOutlet private weak var player1LifeTextField: UITextField!
    @IBOutlet private weak var player2LifeTextField: UITextField!
    @IBOutlet private weak var player1PictureButton: UIButton!
    @IBOutlet private weak var player2PictureButton: UIButton!
    
    private var imagePicker = UIImagePickerController()
    
    private var viewModel = MagicViewModel()
    private var player1PicturePressed = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPassedParameters()
        configureView()
        reloadLifeData()
    }

    @IBAction func pictureButtonTapped(_ sender: UIButton) {
        ImagePickerManager().pickImage(self) { (image) in
            let resizedImage = self.resizeImage(image: image, targetSize: sender.frame.size)
            sender.setImage(resizedImage, for: .normal)
        }
    }
}

//MARK: - View Configuration
extension MagicViewController {
    
    private func configureView() {
        //Todo: Move state change handling to BaseViewController and Model
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        flipElements()
    }
    
    private func flipElements() {
        player2View.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2ToolbarView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player1PictureButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2PictureButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        player1LifeTextField.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                player2LifeTextField.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    private func disableLifeTextFields() {
        player1LifeTextField.isEnabled = false
        player2LifeTextField.isEnabled = false
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
        print(viewModel.matchData)
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
