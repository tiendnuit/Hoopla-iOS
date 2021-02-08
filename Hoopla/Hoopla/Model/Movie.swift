//
//  Movie.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

struct Movie: Codable {
    let id: UInt
    let title: String
    let genres: [Genre]
    let synopsis: String
    let artists: [Artist]
    let artKey: String
}

//MARK: - MoviePresentable
extension Movie: MoviePresentable {
    var imageURL: URL? {
        return URL(string: "\(ApiConfig.defaultConfig.apiEnvironment.imageURL)/\(artKey)_270.jpeg")
    }
    
    var titleText: String {
        return title
    }
    
    var genresText: String {
        return genres.map{$0.name}.joined(separator: ", ")
    }
    
    var synopsisText: String {
        return synopsis
    }
    
    var artistNames: String {
        return artists.map{$0.name}.joined(separator: ", ")
    }
    
    
}
