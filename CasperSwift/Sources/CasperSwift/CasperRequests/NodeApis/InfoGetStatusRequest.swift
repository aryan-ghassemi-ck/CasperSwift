//
//  InfoStatusRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class InfoGetStatusRequest: JsonRpcNetworkRequest<InfoGetStatusResult> {
    public convenience init() {
        self.init(url: CasperEndpoint.node ,method: "info_get_status", param: NoParam())
    }
}

public struct InfoGetStatusResult: Decodable {
    public let apiVersion: String
    public let chainspecName: String
    public let startingStateRootHash: String
    public let ourPublicSigningKey: String
    public let buildVersion: String
    public let uptime: String
    public let lastAddedBlockInfo: BlockInfo
    public let peers: [Peer]
}

public struct BlockInfo: Decodable {
    public let hash: String
    public let timestamp: String
    public let eraId: Int
    public let height: Int
    public let stateRootHash: String
    public let creator: String
}

public struct Peer: Decodable {
    public let nodeId: String
    public let address: String
}
