//
//  Endpoint.swift
//  Characters
//
//  Created by stimLite on 12.06.2022.
//

import Foundation


enum Endpoint {
    case character
    case getImage(indexImage: String)
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .character:
            return "/api/character/"
        case .getImage(let indexImage):
            return "/api/character/avatar/\(indexImage).jpeg"
        }
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    
}
