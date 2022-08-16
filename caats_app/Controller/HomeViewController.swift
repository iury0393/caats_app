//
//  HomeViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit
import FirebaseAuth
import MBProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var randomCatImage: UIImageView!
    
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        catManager.delegate = self
        MBProgressHUD.showAdded(to: self.view, animated: true)
        catManager.getRandomCat()
    }
    
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
//MARK: - CatManagerDelegate

extension HomeViewController: CatManagerDelegate {
    func didUpdateRandomCat(data: Data) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.randomCatImage.image = UIImage(data: data)
        }
    }
}
