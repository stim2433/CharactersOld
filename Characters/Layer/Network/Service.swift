//
//  Service.swift
//  Characters
//
//  Created by stimLite on 12.06.2022.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var method: ServiceMethod { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL not be found")
        }
        var request = URLRequest (url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
    
    public var url: URL? {
        var urlCommponet = URLComponents (string: baseURL)
        urlCommponet?.path = path
        return urlCommponet?.url
    }
}
