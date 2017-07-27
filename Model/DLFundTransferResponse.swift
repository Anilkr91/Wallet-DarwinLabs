//
//  DLFundTransferResponse.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/25/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLFundTransferResponse {
    
    let to: String
    let from: String
    let walletId: String
    let value: Int
    let nonce: Int
    let gasLimit: Int
    let gasPrice: String
    let txHash: String
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        guard  let to: String = "to" <~~ json,
            let from: String = "from" <~~ json,
            let walletId: String = "walletId" <~~ json,
            let value: Int = "value" <~~ json,
            let nonce: Int = "nonce" <~~ json,
            let gasLimit: Int = "gasLimit" <~~ json,
            let gasPrice: String = "gasPrice" <~~ json,
            let txHash: String = "txHash" <~~ json else { return nil }
        
        self.to = to
        self.from = from
        self.walletId = walletId
        self.value = value
        self.nonce = nonce
        self.gasLimit = gasLimit
        self.gasPrice = gasPrice
        self.txHash = txHash
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "to" ~~> self.to,
            "from" ~~> self.from,
            "walletId" ~~> self.walletId,
            "value" ~~> self.value,
            "nonce" ~~> self.nonce,
            "gasLimit" ~~> self.gasLimit,
            "gasPrice" ~~> self.gasPrice,
            "txHash" ~~> self.txHash
            
            ])
    }
}
