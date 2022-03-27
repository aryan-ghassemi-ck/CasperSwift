//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

extension URLSession {
    public func request<ResultType>(from networkRequest: RawNetworkRequest<ResultType>) async throws -> ResultType {
        let urlRequest = try networkRequest.createRequest()
        print("========================")
        print(urlRequest.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "")
        let response = try await URLSession.shared.data(for: urlRequest, delegate: nil)
        print(String(data: response.0, encoding: .utf8) ?? "")
        print("")
        return try networkRequest.deserializer(response.0)
    }
}
