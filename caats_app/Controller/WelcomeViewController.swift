//
//  ViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.4 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }


}

