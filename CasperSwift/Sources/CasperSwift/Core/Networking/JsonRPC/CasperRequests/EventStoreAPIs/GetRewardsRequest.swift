//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class GetRewardsRequest: EventStoreNetworkRequest<[Reward]> {
    public convenience init(publicKey: String, page: Int, limit: Int, order: OrderDirection = .descending) {
        
        let url = EventStoreURL
            .appendingPathComponent("delegators")
            .appendingPathComponent(publicKey)
            .appendingPathComponent("rewards")
            .appending(queryItem: "with_amounts_in_currency_id", value: "1")
            .appending(queryItem: "page", value: "\(page)")
            .appending(queryItem: "limit", value: "\(limit)")
            .appending(queryItem: "order_direction", value: order.value)
        
        self.init(url: url)
    }
}

public struct Reward: Decodable {
    public let eraId: Int
    public let publicKey: String
    public let validatorPublicKey: String
    public let amount: String
    public let timestamp: String
    public let currencyAmount: Decimal
    public let currentCurrencyAmount: Decimal
}
