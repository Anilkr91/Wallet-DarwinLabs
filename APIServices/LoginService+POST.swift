//
//  LoginService+POST.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/24/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class LoginPostService {
    
    static func executeRequest (params:[String: AnyObject] , completionHandler: @escaping (DLUser) -> Void) {
        
        //        let header: HTTPHeaders = ["Authorization" : "Buddy \(Default.getObject(key: "AuthAccessToken"))"]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "/login/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                
                if let response = DLErrorResponse(json: data as! JSON){
                     Alert.showAlertWithError(title: "Error \(response.statusCode)", message: response.message!)
                    
                } else {
                    let user = DLUser(json: data as! JSON)
                    completionHandler(user!)
                }
                
            case .failure(let error):
                Alert.showAlertWithError(title: "Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
