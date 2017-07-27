//
//  DLCreateWalletResponse.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/27/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLCreateWalletResponse {
    
    let __v: Bool
    let _id: String
    let createdAt: String
    let updatedAt: String
    let user: String
    let xpub: String
    
    init (__v: Bool, _id: String, createdAt: String, updatedAt: String, user: String, xpub: String) {
        self.__v = __v
        self._id = _id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.user = user
        self.xpub = xpub
    }
    
    // MARK: - Deserialization
    init?(json: JSON) {
        print(json)
        guard  let __v: Bool = "__v" <~~ json,
            let _id: String = "_id" <~~ json,
            let createdAt: String = "createdAt" <~~ json,
            let updatedAt: String = "updatedAt" <~~ json,
            let user: String = "user" <~~ json,
            let xpub: String = "xpub" <~~ json else { return nil }
        
        self.__v = __v
        self._id = _id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.user = user
        self.xpub = xpub
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "__v" ~~> self.__v,
            "_id" ~~> self._id,
            "createdAt" ~~> self.createdAt,
            "updatedAt" ~~> self.updatedAt,
            "user" ~~> self.user,
            "xpub" ~~> self.xpub,
            ])
    }
}
