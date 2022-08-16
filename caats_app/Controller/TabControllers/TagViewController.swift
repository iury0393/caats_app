//
//  TagViewController.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 16/08/22.
//

import UIKit
import MBProgressHUD

class TagViewController: UIViewController {

    @IBOutlet weak var tagPick: UIPickerView!
    @IBOutlet weak var catImage: UIImageView!
    
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catManager.delegateTag = self
        tagPick.dataSource = self
        tagPick.delegate = self
    }
}
//MARK: - UIPickerViewDataSource

extension TagViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catManager.tags.count
    }
}
//MARK: - UIPickerViewDelegate

extension TagViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catManager.tags[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedTag = catManager.tags[row]
        print(selectedTag)
        MBProgressHUD.showAdded(to: self.view, animated: true)
        catManager.getRandomCat(tag: selectedTag)
    }
}
//MARK: - CatManagerImageTagDelegate

extension TagViewController: CatManagerImageTagDelegate {
    func didUpdateImageTag(data: Data) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.catImage.image = UIImage(data: data)
        }
    }
}
