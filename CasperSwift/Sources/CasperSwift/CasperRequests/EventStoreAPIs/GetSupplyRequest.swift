//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class GetSupplyRequest: EventStoreNetworkRequest<SupplyResult> {
    public convenience init() {
        self.init(url: CasperEndpoint.eventStore.appendingPathComponent("supply"))
    }
}

public struct SupplyResult: Decodable {
    public let token: String
    public let total: Int
    public let circulating: Int
    public let timestamp: Int
}
