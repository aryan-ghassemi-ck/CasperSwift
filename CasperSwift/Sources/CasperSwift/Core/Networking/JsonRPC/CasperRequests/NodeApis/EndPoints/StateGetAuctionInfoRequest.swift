//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import Foundation

public class StateGetAuctionInfoRequest: JsonRpcNetworkRequest<StateGetAuctionInfoResult> {
    public convenience init(environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: "state_get_auction_info", param: NoParam())
    }
}

public struct StateGetAuctionInfoResult: Decodable {
    public let apiVersion: String
    public let auctionState: AuctionState
}

public struct AuctionState: Decodable {
    public let stateRootHash: String
    public let blokHeight: Int?
    public let eraValidators: [EraValidator]
    public let bids: [Bid]
}

public struct EraValidator: Decodable {
    public let eraId: Int
    public let validatorWeights: [ValidatorWeight]
}

public struct ValidatorWeight: Decodable {
    public let publicKey: String
    public let weight: String
}

public struct Bid: Decodable {
    public let publicKey: String
    public let bid: BidInfo
}

public struct BidInfo: Decodable {
    public let bondingPurse: String
    public let stakedAmount: String
    public let delegationRate: Int
    public let delegators: [Delegator]
    public let inactive: Bool
}

public struct Delegator: Decodable {
    public let publicKey: String
    public let stakedAmount: String
    public let bondingPurse: String
    public let delegatee: String
}
