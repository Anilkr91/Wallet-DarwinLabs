//
//  GRLoginUser.swift
//
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLUser {

    let _id : String
    let token: String
    
    
    init(_id : String, token: String) {
        self._id = _id
        self.token = token
    }
    
    // MARK: - Deserialization
    init?(json: JSON) {
        guard let _id: String = "_id" <~~ json,
            let token: String = "token" <~~ json else { return nil }
        
        self._id = _id
        self.token = token
    }
}
