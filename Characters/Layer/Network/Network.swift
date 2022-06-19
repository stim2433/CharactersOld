//
//  Network.swift
//  Characters
//
//  Created by stimLite on 12.06.2022.
//

import Foundation

class ServiceNetwork<T: Service> {
    var urlSession = URLSession.shared
    
    init () { }
    
    func load (service: T, complition: @escaping (Result<Data, Error>) -> Void) {
        call(service.urlRequest, complition: complition)
    }
    
    func load (stringUrl: String, complition: @escaping (Result<Data, Error>) -> Void) {
        call(stringUrl, complition: complition)
    }
    
    func load<U> (service: T, dataType: U.Type, complition: @escaping (Result<U, Error>) -> Void) where U: Decodable {
        
        
        call(service.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder ()
                do {
                    let obj = try decoder.decode(dataType.self, from: data)
                    complition(.success(obj))
                } catch {
                    complition(.failure(error))
                }
                
            case .failure(let error):
                complition (.failure(error))
            }
            
        }
    }
}

extension ServiceNetwork {
    private func call (_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, complition: @escaping (Result<Data, Error>) -> Void) {
        
        urlSession.dataTask(with: request) { data, _, error in
            if let error = error {
                deliverQueue.async {
                    complition(.failure(error))
                }
            } else {
                deliverQueue.async {
                    complition(.success(data!))
                }
            }
            
        }.resume()
    }
    
    private func call (_ stringURL: String, deliverQueue: DispatchQueue = DispatchQueue.main, complition: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL (string: stringURL) else { return }
        
        
        urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                deliverQueue.async {
                    complition(.failure(error))
                }
            } else {
                deliverQueue.async {
                    complition(.success(data!))
                }
            }
            
        }.resume()
    }
}
