//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class CodableNetworkRequest<ResultType>: RawNetworkRequest<ResultType> where ResultType: Decodable {
    
    public init(
        url: URL,
        httpMethod: HttpMethod = .get,
        body: @escaping DataProvider = { nil },
        httpHeaders: [String: String] = [:],
        jsonDecoder: JSONDecoder = JSONDecoder(),
        customDeserializer: Deserializer? = nil) {
            
        var defaultHeaders: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
            
        defaultHeaders = defaultHeaders.merging(httpHeaders, uniquingKeysWith: { $1 })
            
        let deserializer: Deserializer = customDeserializer ?? {
            try jsonDecoder.decode(ResultType.self, from: $0)
        }
            
        super.init(url: url, httpMethod: httpMethod, body: body, httpHeaders: defaultHeaders, deserializer: deserializer)
    }
    
    public convenience init<Body: Encodable>(
        url: URL,
        httpMethod: HttpMethod,
        encodableBody: Body? = nil,
        httpHeaders: [String: String] = [:],
        jsonDecoder: JSONDecoder = JSONDecoder(),
        jsonEncoder: JSONEncoder = JSONEncoder(),
        customDeserializer: Deserializer? = nil) {

        let dataProvider: DataProvider = {
            if let encodableBody = encodableBody {
                return try jsonEncoder.encode(encodableBody)
            } else {
                return nil
            }
        }
            
        self.init(
            url: url,
            httpMethod: httpMethod,
            body: dataProvider,
            httpHeaders: httpHeaders,
            jsonDecoder: jsonDecoder,
            customDeserializer: customDeserializer)
    }
}
