//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class EventStoreNetworkRequest<T: Decodable>: CodableNetworkRequest<T> {
    public convenience init(url: URL) {
        let deserializer: Deserializer = {
            let response = try JSONDecoder().decode(WrappedData<T>.self, from: $0)
            return response.data
        }
        
        self.init(url: url, customDeserializer: deserializer)
    }
}

public struct WrappedData<T: Decodable>: Decodable {
    public let data: T
}
