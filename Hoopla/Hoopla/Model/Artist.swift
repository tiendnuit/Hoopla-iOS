//
//  Artist.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation
struct Artist: Codable {
    let id: UInt
    let name: String
    let relationship: String
    let favorite: Bool
}
