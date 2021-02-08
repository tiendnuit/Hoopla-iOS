//
//  Genre.swift
//  Hoopla
//
//  Created by Scor Doan on 05/02/2021.
//

import Foundation

struct Genre: Codable {
    let id: UInt
    let kindId: UInt
    let name: String
    let hasChildren: Bool
}
