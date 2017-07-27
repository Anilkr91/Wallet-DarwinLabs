//
//  DLFundTransfer.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/25/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct DLFundTransfer {
    
    let to: String
    let amount: Double
    
    init(to: String, amount: Double) {
        self.to = to
        self.amount = amount
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "to" ~~> self.to,
            "amount" ~~> self.amount
            ])
    }
}
