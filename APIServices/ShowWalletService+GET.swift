//
//  ShowWalletService+GET.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/25/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class ShowWalletGetService {
    static func executeRequest (completionHandler: @escaping (DLUserWallet) -> Void) {
        
        let token = Default.getCurrentUser().token
        let header: HTTPHeaders = ["x-access-token" : token]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "/wallet/ethereum/", method: .get, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                
                if let response = DLErrorResponse(json: data as! JSON){
                    Alert.showAlertWithError(title: "Error \(response.statusCode)", message: response.Error!)
                } else {
                    let wallet = DLUserWallet(json: data as! JSON)
                    completionHandler(wallet!)
                }
        
            case .failure(let error):
                 Alert.showAlertWithError(title: "Error", message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
