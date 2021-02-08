//
//  OverviewMoviePresentable.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation
protocol OverviewMoviePresentable {
    var id: UInt {get}
    var imageURL: URL? {get}
    var titleText: String {get}
    var kindText: String {get}
    var artistNameText: String {get}
}
