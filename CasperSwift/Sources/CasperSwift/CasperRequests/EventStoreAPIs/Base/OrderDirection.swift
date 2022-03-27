//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

public enum OrderDirection {
    case ascending
    case descending
    
    var value: String {
        switch self {
        case .descending: return "DESC"
        case .ascending: return "ASCE"
        }
    }
}
