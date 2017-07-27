//
//  DLTransactionHistory.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct DLTransactionHistory : Decodable{
    
    let blockHash: String
    let blockNumber: String
    let confirmations: String
    let contractAddress: String
    let cumulativeGasUsed: String
    let from: String
    let gas: String
    let gasPrice: String
    let gasUsed: String
    let hash: String
    let input: String
    let isError: String
    let nonce: String
    let timeStamp: String
    let to: String
    let transactionIndex: String
    let value: String
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        
        guard  let blockHash: String = "blockHash" <~~ json,
            let blockNumber: String = "blockNumber" <~~ json,
            let confirmations: String  = "confirmations" <~~ json,
            let contractAddress: String = "contractAddress" <~~ json,
            let cumulativeGasUsed: String = "cumulativeGasUsed" <~~ json,
            let from: String = "from" <~~ json,
            let gas: String = "gas" <~~ json,
            let gasPrice: String = "gasPrice" <~~ json,
            let gasUsed: String = "gasUsed" <~~ json,
            let hash: String = "hash" <~~ json,
            let input: String = "input" <~~ json,
            let isError: String = "isError" <~~ json,
            let nonce: String = "nonce" <~~ json,
            let timeStamp: String = "timeStamp" <~~ json,
            let to: String = "to" <~~ json,
            let transactionIndex: String = "transactionIndex" <~~ json,
            let value: String = "value" <~~ json else { return nil }
        
        self.blockHash = blockHash
        self.blockNumber = blockNumber
        self.confirmations = confirmations
        self.contractAddress = contractAddress
        self.cumulativeGasUsed = cumulativeGasUsed
        self.from = from
        self.gas = gas
        self.gasPrice = gasPrice
        self.gasUsed = gasUsed
        self.hash = hash
        self.input = input
        self.isError = isError
        self.nonce = nonce
        self.timeStamp = timeStamp
        self.to = to
        self.transactionIndex = transactionIndex
        self.value = value
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "blockHash" ~~> self.blockHash,
            "blockNumber" ~~> self.blockNumber,
            "confirmations" ~~> self.confirmations,
            "contractAddress" ~~> self.contractAddress,
            "cumulativeGasUsed" ~~> self.cumulativeGasUsed,
            "from" ~~> self.from,
            "gas" ~~> self.gas,
            "gasPrice" ~~> self.gasPrice,
            "gasUsed" ~~> self.gasUsed,
            "hash" ~~> self.hash,
            "input" ~~> self.input,
            "isError" ~~> self.isError,
            "nonce" ~~> self.nonce,
            "timeStamp" ~~> self.timeStamp,
            "to" ~~> self.to,
            "transactionIndex" ~~> self.transactionIndex,
            "value" ~~> self.value
            ])
    }
}
