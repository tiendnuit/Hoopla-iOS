//
//  OverviewMovieViewPresentable.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit

protocol OverviewResourcePresentable {
    var thumbImageView: UIImageView! {set get}
    var titleLabel: UILabel! {set get}
    var artistLabel: UILabel! {set get}
}

extension OverviewResourcePresentable {
    func map(item: OverviewMoviePresentable?) {
        guard let movie = item else { return }
        titleLabel?.text = movie.titleText
        artistLabel?.text = movie.artistNameText

        if let imageURL = movie.imageURL {
            thumbImageView?.imageFromURL(url: imageURL)
        } else {
            thumbImageView?.image = nil
        }
    }
}
