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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
extension MagicViewController {
    
    private func configureView() {
        player2View.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player1ToolbarView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
}
