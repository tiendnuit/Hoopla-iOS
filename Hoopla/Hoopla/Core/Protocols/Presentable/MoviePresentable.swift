//
//  MoviePresentable.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

protocol MoviePresentable {
    var imageURL: URL? {get}
    var titleText: String {get}
    var genresText: String {get}
    var synopsisText: String {get}
    var artistNames: String {get}
}
