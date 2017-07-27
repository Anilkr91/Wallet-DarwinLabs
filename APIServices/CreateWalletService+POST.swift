//
//  CreateWalletService+POST.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/24/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class CreateWalletPostService {
    static func executeRequest (completionHandler: @escaping (DLCreateWalletResponse) -> Void) {
       
        let token = Default.getCurrentUser().token
        let header: HTTPHeaders = ["x-access-token" : token]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "/wallet/ethereum/create/", method: .post, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
                
            case .success(let data):
                
                if let response = DLErrorResponse(json: data as! JSON){
                    Alert.showAlertWithError(title: "Error \(response.statusCode)", message: response.errmsg!)
                } else {
                    let data = DLCreateWalletResponse(json: data as! JSON)
                    completionHandler(data!)
                }
            
            case .failure(let error):
                 Alert.showAlertWithError(title: "Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
