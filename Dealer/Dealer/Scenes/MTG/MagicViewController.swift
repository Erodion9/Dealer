//
//  MagicViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 17.02.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class MagicViewController: BaseViewController {
    
    @IBOutlet weak var demoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        demoLabel.text = "Magic!"
    }
}
