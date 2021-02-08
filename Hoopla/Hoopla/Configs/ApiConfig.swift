//
//  ApiConfig.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

enum APIEnvironment: String {
    case dev = "dev"
    case prod = "prod"
    
    var apiURL: String {
        switch self {
        case .dev:
            return "https://hoopla-ws.hoopladigital.com"
        case .prod:
            return "https://hoopla-ws.hoopladigital.com"
        }
    }
    
    var imageURL: String {
        switch self {
        case .dev:
            return "https://d2snwnmzyr8jue.cloudfront.net"
        case .prod:
            return "https://d2snwnmzyr8jue.cloudfront.net"
        }
    }
}
struct ApiConfig {
    static var defaultConfig = ApiConfig()
    let apiEnvironment = APIEnvironment(rawValue: Bundle.main.infoDictionary![Constants.ApiConfig.enviroment] as! String)!
}

extension Constants {
    struct ApiConfig {
        static let enviroment = "APIEnvironment"
    }
}
