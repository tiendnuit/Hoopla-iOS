//
//  ListMovieDataSource.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import UIKit

class ListMovieDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    weak var delegate: ListOverviewMovieProtocol?
    
    init(delegate: ListOverviewMovieProtocol) {
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item not exists")
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OverviewMovieViewCell.typeName, for: indexPath) as? OverviewMovieViewCell else {
            fatalError("Cell not exists")
        }
        
        cell.configure(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space = (CGFloat.defaultItemsPerRow + 1)*CGFloat.defaultComponentsSpacing
        return CGSize(width: (UIScreen.main.bounds.width - space)/CGFloat.defaultItemsPerRow, height: CGFloat.defaultCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemSelected(at: indexPath)
    }
}
