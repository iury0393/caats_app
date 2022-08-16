//
//  CatManager.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 16/08/22.
//

import Foundation
import Alamofire

protocol CatManagerRandomImageDelegate {
    func didUpdateRandomCat(data: Data)
}

protocol CatManagerImageTagDelegate {
    func didUpdateImageTag(data: Data)
}

protocol CatManagerImageTextDelegate {
    func didUpdateImageText(data: Data)
}

protocol CatManagerRandomGifDelegate {
    func didUpdateRandomGif(data: Data)
}

struct CatManager {
    var delegate: CatManagerRandomImageDelegate?
    let url = "https://cataas.com/c"
    
    func getRandomCat() {
        AF.request(url)
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                switch response.response?.statusCode {
                case 200, 204:
                    delegate?.didUpdateRandomCat(data: data!)
                case 500:
                    debugPrint("Error 500")
                default:
                    debugPrint("Erro default")
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
