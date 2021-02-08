//
//  OverviewMovie.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation

struct OverviewMovie: Codable {
    let titleId: UInt
    let title: String
    let kindId: Int
    let kind: String
    let artistName: String
    let artKey: String
}

//MARK: - OverviewMoviePresentable
extension OverviewMovie: OverviewMoviePresentable {
    var id: UInt {
        return titleId
    }
    
    var imageURL: URL? {
        return URL(string: "\(ApiConfig.defaultConfig.apiEnvironment.imageURL)/\(artKey)_270.jpeg")
    }
    
    var titleText: String {
        return title
    }
    
    var kindText: String {
        return kind.uppercased()
    }
    
    var artistNameText: String {
        return artistName
    }
}
