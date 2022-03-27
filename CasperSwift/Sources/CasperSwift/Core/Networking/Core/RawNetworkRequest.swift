//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class RawNetworkRequest<ResultType> {
    
    /*
     Instead of passing Data directly pass through a closure
     To prevent eager serialization when passing a Codable object in case the request is created on the main thread
    */
    public typealias DataProvider = () throws -> Data?
    public typealias Deserializer = (Data) throws -> ResultType
    public let deserializer: Deserializer
    public let body: DataProvider
    public let url: URL
    public let httpMethod: HttpMethod
    public let httpHeaders: [String: String]
    
    public init(
        url: URL,
        httpMethod: HttpMethod = .get,
        body: @escaping DataProvider = { nil },
        httpHeaders: [String: String] = [:],
        deserializer: @escaping Deserializer) {

        self.url = url
        self.httpMethod = httpMethod
        self.body = body
        self.httpHeaders = httpHeaders
        self.deserializer = deserializer
    }
}

extension RawNetworkRequest {
    
    func createRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue.uppercased()
        request.httpBody = try body()
        
        httpHeaders.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }
}
