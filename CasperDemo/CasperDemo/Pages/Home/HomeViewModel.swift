//
//  HomeViewModel.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import Foundation
import CasperSwift

final class HomeViewModel: ObservableObject {
    
    private let casperClient: CasperNodeClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
    @Published var isLoading = true
    @Published var info: InfoGetStatusResult?
    
    func fetchData() {
        Task {
            do {
                let rootHash = try await casperClient.getStateRootHash()
                let auctionState = try await casperClient.getAuctionState()
                let nodeStatus = try await casperClient.getNodeStatus()
                
                let activeBids = auctionState.bids.filter { $0.bid.inactive == false }
                let highestStaked = activeBids.sorted { $0.bid.stakedAmount > $1.bid.stakedAmount }
                
                auctionState.eraValidators.forEach { era in
                    print("==============")
                    print(era.eraId)
                    era.validatorWeights.forEach { weight in
                        print(weight.publicKey)
                        print(weight.weight) // total staked
                    }
                }
                
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
