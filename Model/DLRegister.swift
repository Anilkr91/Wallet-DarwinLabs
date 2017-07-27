//
//  GRRegister.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/24/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLRegister {
    
    let name: String
    let password: String
    let phone: String
    let email: String
    
    // MARK: - Deserialization
    
    init(name: String, password: String, phone: String, email: String) {
        self.name = name
        self.password = password
        self.phone = phone
        self.email = email
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name ,
            "password" ~~> self.password,
            "phone" ~~> self.phone,
            "email" ~~> self.email
            ])
    }
}
