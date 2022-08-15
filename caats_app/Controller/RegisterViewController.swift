//
//  RegisterViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func registerPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginToHome", sender: self)
    }
}

