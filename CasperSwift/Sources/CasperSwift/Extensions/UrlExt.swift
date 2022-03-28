//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

extension URL {

    // TODO: Remove use of !
    func appending(queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
