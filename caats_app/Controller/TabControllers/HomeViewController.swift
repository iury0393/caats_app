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
        tabBarController?.delegate = self
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

extension HomeViewController: CatManagerRandomImageDelegate {
    func didUpdateRandomCat(data: Data) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.randomCatImage.image = UIImage(data: data)
        }
    }
}
//MARK: - UITabBarControllerDelegate

extension HomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            if index == 0 {
                MBProgressHUD.showAdded(to: self.view, animated: true)
                catManager.getRandomCat()
            } else if index == 3 {
            }
        }
    }
}
