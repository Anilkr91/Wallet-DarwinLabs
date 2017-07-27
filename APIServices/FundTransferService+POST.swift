//
//  FundTransferService+POST.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/25/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class FundTransferPostService {
    static func executeRequest (params:[String: AnyObject] , completionHandler: @escaping (DLFundTransferResponse) -> Void) {
        
        let token = Default.getCurrentUser().token
        let header: HTTPHeaders = ["x-access-token":token]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "/wallet/ethereum/send/", method: .post,  parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                
                if let response = DLErrorResponse(json: data as! JSON){
                    Alert.showAlertWithError(title: "Error \(response.statusCode)", message: response.Error!)
                } else {
                    let user = DLFundTransferResponse(json: data as! JSON)
                    completionHandler(user!)
                }
                
            case .failure(let error):
                Alert.showAlertWithError(title: "Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
