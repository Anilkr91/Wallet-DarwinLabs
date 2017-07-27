//
//  DLogin.swift
//
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLLogin {
    
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "email" ~~> self.email,
            "password" ~~> self.password
            ])
    }
}
