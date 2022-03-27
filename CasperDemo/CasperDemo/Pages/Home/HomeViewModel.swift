//
//  HomeViewModel.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import Foundation
import CasperSwift

final class HomeViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var info: InfoGetStatusResult?
    
    func fetchData() {
        Task {
            do {
//                let blockInfo = try await URLSession.shared.request(from: ChainGetBlockRequest(blockIdentifier: .hash("7cf5b3ac734360457c9ceb11415c7f42acb343ab75d323de12563a8c5c0abee1")))
//                print(blockInfo.block.header.height)
//
//                let blockInfo2 = try await URLSession.shared.request(from: ChainGetBlockRequest(blockIdentifier: .hash("09c06e81100e7aade9fd22289ac67188b8163f8e85b574b66a6b60d6b4b5ebf0")))
//                print(blockInfo2.block.header.height)
//
//                let blockInfo3 = try await URLSession.shared.request(from: ChainGetBlockRequest(blockIdentifier: .height(652630)))
//                print(blockInfo3.block.header.height)
//
//                let supply = try await URLSession.shared.request(from: GetSupplyRequest())
//
//                let price = try await URLSession.shared.request(from: GetPriceRequest())
//
//                let myRewardsRequest = GetRewardsRequest(publicKey: "018a90a56a239c42ce728d06f53f957319f6f892defc5738ba9b0ee02dd91ba901", page: 1, limit: 10)
//
//                let myRewards = try await URLSession.shared.request(from: myRewardsRequest)
//
//                let myTransfersRequest = GetTransfersRequest(accountHash: "d90e939d8e9e39acdd21d79eb2a01a7f1aa71fc05e037520248752ded0ef5ef5", page: 1, limit: 10)
//
//                let myTransfers = try await URLSession.shared.request(from: myTransfersRequest)
                
                let rootHash = try await URLSession.shared.request(from: ChainGetStateRootHashRequest())
                print(rootHash.stateRootHash)
                
//                let rootHash2 = try await URLSession.shared.request(from: ChainGetStateRootHashRequest(blockIdentifier: .height(652661)))
//                print(rootHash2.stateRootHash)
//                let status = try await URLSession.shared.request(from: InfoGetStatusRequest())
//                //let auctionInfo = try await URLSession.shared.jsonRpc(from: StateGetAuctionInfoRequest())
//
                let accountHash = "24b6d5aabb8f0ac17d272763a405e9ceca9166b75b745cf200695e172857c2dd"

                let accountRequest = StateGetItemRequest(
                    params: StateGetItemParameters(
                        keyRepresentable: .accountHash(accountHash),
                        stateRootHash: rootHash.stateRootHash
                    )
                )

                let accountInfo = try await URLSession.shared.request(from: accountRequest)


                let balanceRequest = StateGetBalanceRequest(
                    params: StateGetBalanceParameters(
                        purseUref: accountInfo.storedValue.Account.mainPurse,
                        stateRootHash: rootHash.stateRootHash
                    )
                )

                let balance = try await URLSession.shared.request(from: balanceRequest)
//
//
//                let deployRequest = InfoGetDeployRequest(param: InfoGetDeployParameters(deployHash: "2ff0b24da475cee2ded5236f9d9023a6120c55583712f15eb8670870fbc74fa6"))
//                let deployResult = try await URLSession.shared.request(from: deployRequest)
                
                DispatchQueue.main.async {
//                    self.info = stateInfo
//                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        }
    }
}
