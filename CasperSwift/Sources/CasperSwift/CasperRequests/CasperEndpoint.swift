//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import Foundation

/*
 TODO:
 
 chain_get_block_transfers
 chain_get_era_info_by_switch_block
 state_get_dictionary_item
 https://casper.network/docs/dapp-dev-guide/calling-contracts/
 */

enum CasperEndpoint {
    // http://casper-rpc-docs.s3-website-us-east-1.amazonaws.com/
    /*
     If you are to interact with chain please use address http://<node ip address>:7777/rpc
     node ip address can be found here https://testnet.cspr.live/
     */
    static let node = URL(string: "https://node-clarity-mainnet.make.services/rpc")!
    
    static let eventStore = URL(string: "https://event-store-api-clarity-mainnet.make.services")!
}
