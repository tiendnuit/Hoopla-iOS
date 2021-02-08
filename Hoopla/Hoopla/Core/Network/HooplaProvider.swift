//
//  HooplaProvider.swift
//  Hoopla
//
//  Created by Scor Doan on 06/02/2021.
//

import Foundation

enum HooplaError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure(_ error: Error)
    case noDataError
    case serverError(_ error: Error)
}

enum APIType {
    case `default`, mock
}


class HooplaProvider<E: Endpoint> {
    var session: URLSession
    var type: APIType
    
    init(session: URLSession = .shared, type: APIType = .default) {
        self.session = session
        self.type = .default
    }
    
    func request<T: Decodable>(_ endpoint: E, completion: @escaping (Result<T, HooplaError>) -> Void) {
        guard type == .default else {
            requestMockData(endpoint, completion: completion)
            return
        }
        let urlRequest = endpoint.urlRequest

        session.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(.serverError(error)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noDataError))
                    return
                }
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailure(error)))
            }
        }.resume()
    }
    
    private func requestMockData<T: Decodable>(_ endpoint: E, completion: @escaping (Result<T, HooplaError>) -> Void) {
        guard let data = endpoint.mockData else {
            completion(.failure(.noDataError))
            return
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decoded))
        } catch {
            completion(.failure(.decodingFailure(error)))
        }
    }
}


