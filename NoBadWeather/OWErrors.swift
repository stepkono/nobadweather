//
//  OWErrors.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 12.10.24.
//

import Foundation

enum OWErrors: Error {
    case invalidURL
    case invalidResponce(statusCode: Int)
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return "The property names probably don't match the JSON keys."
        default: return "No description available."
        }
    }
}
