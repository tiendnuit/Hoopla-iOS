//
//  ListOverviewMovieProtocol.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
///These functions adopted by the object that manage the Video data for tableview or collectionView
protocol ListOverviewMovieProtocol: class {
    var items: [OverviewMoviePresentable] {get}
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> OverviewMoviePresentable?
    func itemSelected(at: IndexPath)
}

extension ListOverviewMovieProtocol {
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> OverviewMoviePresentable? {
        guard indexPath.row < items.count else { return nil }
        return items[indexPath.row]
    }
    
    func itemSelected(at indexPath: IndexPath) {
        // selected Item
    }
}
