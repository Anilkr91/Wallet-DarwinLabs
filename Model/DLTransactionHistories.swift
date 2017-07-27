//
//  DLTransactionHistories.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLTransactionHistories {
    let message: String
    let status: String
    let results: [DLTransactionHistory]
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        guard  let message: String = "message" <~~ json,
            let status: String = "status" <~~ json,
            let results: [DLTransactionHistory] = "result" <~~ json else { return nil }

        self.message = message
        self.status = status
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "message" ~~> self.message,
            "status" ~~> self.status,
            "result" ~~> self.results
            ])
    }
}
