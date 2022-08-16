//
//  GifViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 16/08/22.
//

import UIKit
import MBProgressHUD

class GifViewController: UIViewController {

    @IBOutlet weak var catGif: UIImageView!
    
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catManager.delegateGif = self
        MBProgressHUD.showAdded(to: self.view, animated: true)
        catManager.getRandomGif()
        
    }
}
//MARK: - CatManagerRandomGifDelegate

extension GifViewController: CatManagerRandomGifDelegate {
    func didUpdateRandomGif(data: Data) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.catGif.image = UIImage.gifImageWithData(data)
        }
    }
}
