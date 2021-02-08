//
//  Endpoint.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    var baseURL: String {get}
    var path: String {get}
    var parameters: [String: Any]? {get}
    var headers: [String: Any]? {get}
    var method: ServiceMethod {get}
    var mockData: Data? {get}
}

extension Endpoint {
    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        
        if method == .get {
            if let params = parameters as? [String : String] {
                urlComponents?.queryItems = params.map{URLQueryItem(name: $0.key, value: $0.value)}
            }
        }
        
        return urlComponents?.url
    }
    
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        //params
        if let params = parameters,
           let bodyData = try? JSONSerialization.data(withJSONObject: params, options: []) {
            request.httpBody = bodyData
        }
        
        //header
        //....
        
        return request
    }
}
