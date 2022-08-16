//
//  CatManager.swift
//  caats_app
//
//  Created by Iury Vasconcelos on 16/08/22.
//

import Foundation
import Alamofire

protocol CatManagerDelegate {
    func didUpdateRandomCat(data: Data)
}

struct CatManager {
    var delegate: CatManagerDelegate?
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
