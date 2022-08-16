//
//  TextViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 16/08/22.
//

import UIKit
import MBProgressHUD

class TextViewController: UIViewController {

    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var catImage: UIImageView!
    
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catManager.delegateText = self
    }
    

    @IBAction func generatePressed(_ sender: UIButton) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        if let word = wordTextField.text {
            catManager.getRandomCat(text: word)
        }
    }
}
//MARK: - CatManagerImageTextDelegate

extension TextViewController: CatManagerImageTextDelegate {
    func didUpdateImageText(data: Data) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.catImage.image = UIImage(data: data)
        }
    }
}
