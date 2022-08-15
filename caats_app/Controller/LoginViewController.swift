//
//  LoginViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginToHome", sender: self)
    }
}
