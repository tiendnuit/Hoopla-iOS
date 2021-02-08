//
//  HooplaAPI.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

enum HooplaAPI {
    case topMovies
    case detailMovie(id: UInt)
}

extension HooplaAPI: Endpoint {
    var baseURL: String {
        return ApiConfig.defaultConfig.apiEnvironment.apiURL
    }
    
    var path: String {
        switch self {
        case .topMovies:
            return "/kinds/7/titles/top"
        case .detailMovie(let id):
            return "/titles/\(id)"
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var headers: [String: Any]? {
        return nil
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    //Mock data
    var mockData: Data? {
        return nil
    }
    
    
}
