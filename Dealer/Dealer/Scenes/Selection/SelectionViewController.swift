//
//  ViewController.swift
//  Dealer
//
//  Created by Deniz Mavi on 26.01.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class SelectionViewController: BaseViewController {

    @IBOutlet private weak var magicButton: UIButton!
    @IBOutlet private weak var yugiohButton: UIButton!
    @IBOutlet private weak var pokemonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: - Actions
private extension SelectionViewController {

    @IBAction func magicButtonTapped(_ sender: Any) {
        show(storyboard: .magic, style: .popover, passedParameters: nil)
    }
    @IBAction func yugiohButtonTapped(_ sender: Any) {
        show(storyboard: .yugioh, style: .popover, passedParameters: nil)
    }
    @IBAction func pokemonButtonTapped(_ sender: Any) {
        //show(storyboard: .pokemon, style: .fullScreen)
        print("Not yet implemented.")
    }
}

extension SelectionViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case magic = "MagicSetup"
        case yugioh = "YGOSetup"
        case pokemon = "Pokemon"
    }
}

