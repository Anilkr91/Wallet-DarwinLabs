//
//  DLErrorResponse.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/27/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLErrorResponse {
    
    let success: Bool?
    let Error: String?
    let statusCode: Int
    let message: String?
    let errmsg: String?
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        print(json)
        guard let statusCode: Int = "statusCode" <~~ json else { return nil }
        
        self.success = "error.success" <~~ json
        self.Error = "error.Error" <~~ json
        self.statusCode = statusCode
        self.message = "error.message" <~~ json
        self.errmsg = "error.errmsg" <~~ json
    }
}
