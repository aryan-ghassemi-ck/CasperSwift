//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

enum CasperNodeMethod: String {
    case accountPutDeploy = "account_put_deploy"
    case chainGetBlock = "chain_get_block"
    case chainGetEraInfoBySwitchBlock = "chain_get_era_info_by_switch_block"
    case chainGetStateRootHash = "chain_get_state_root_hash"
    case infoGetDeploy = "info_get_deploy"
    case infoGetPeers = "info_get_peers"
    case infoGetStatus = "info_get_status"
    case stateGetAuctionInfo = "state_get_auction_info"
    case stateGetBalance = "state_get_balance"
    case stateGetItem = "state_get_item"
    case chainGetBlockTransfers = "chain_get_block_transfers"
}
