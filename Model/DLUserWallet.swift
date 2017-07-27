//
//  DLUserWallet.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/25/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLUserWallet {
    
    let __v: Bool
    let _id: String
    let createdAt: String
    let updatedAt: String
    let user: String
    let xpub: String
    let balance: String
    
    // MARK: - Deserialization
    init?(json: JSON) {
        guard  let __v: Bool = "account.__v" <~~ json,
            let _id: String = "account._id" <~~ json,
            let createdAt: String = "account.createdAt" <~~ json,
            let updatedAt: String = "account.updatedAt" <~~ json,
            let user: String = "account.user" <~~ json,
            let xpub: String = "account.xpub" <~~ json,
            let balance: String = "balance" <~~ json else { return nil }
        
        self.__v = __v
        self._id = _id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.user = user
        self.xpub = xpub
        self.balance = balance
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "account.__v" ~~> self.__v,
            "account._id" ~~> self._id,
            "account.createdAt" ~~> self.createdAt,
            "account.updatedAt" ~~> self.updatedAt,
            "account.user" ~~> self.user,
            "account.xpub" ~~> self.xpub,
            "balance" ~~> self.balance
            ])
    }
}
