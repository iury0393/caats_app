//
//  HomeViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit
import FirebaseAuth
import Alamofire

class HomeViewController: UIViewController {    
    @IBOutlet weak var randomCatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func randomPressed(_ sender: UIButton) {

    }
}
