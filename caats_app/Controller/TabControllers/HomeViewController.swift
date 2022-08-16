//
//  HomeViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 11/08/22.
//

import UIKit
import MBProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var randomCatImage: UIImageView!
    
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        catManager.delegateImage = self
        MBProgressHUD.showAdded(to: self.view, animated: true)
        catManager.getRandomCat()
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
