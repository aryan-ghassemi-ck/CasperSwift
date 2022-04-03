//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class GetTransfersRequest: EventStoreNetworkRequest<[MyTransfer]> {
    public convenience init(accountHash: String, page: Int, limit: Int, order: OrderDirection = .descending) {
        
        let url = EventStoreURL
            .appendingPathComponent("accounts")
            .appendingPathComponent(accountHash)
            .appendingPathComponent("transfers")
            .appending(queryItem: "with_extended_info", value: "1")
            .appending(queryItem: "page", value: "\(page)")
            .appending(queryItem: "limit", value: "\(limit)")
            .appending(queryItem: "order_direction", value: order.value)
        
        self.init(url: url)
    }
}

public struct MyTransfer: Decodable {
    public let transferId: String?
    public let deployHash: String
    public let blockHash: String
    public let sourcePurse: String
    public let targetPurse: String
    public let amount: String
    public let fromAccount: String
    public let toAccount: String
    public let timestamp: String
    public let fromAccountPublicKey: String
    public let toAccountPublicKey: String?
}
