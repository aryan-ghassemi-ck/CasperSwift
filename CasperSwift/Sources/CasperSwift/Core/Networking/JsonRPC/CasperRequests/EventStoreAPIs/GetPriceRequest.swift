//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class GetPriceRequest: EventStoreNetworkRequest<Float> {
    public convenience init() {
        self.init(url: EventStoreURL.appendingPathComponent("rates/1/amount"))
    }
}
