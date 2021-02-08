//
//  MovieViewPresentable.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit

protocol MovieViewPresentable {
    var movieImageView: UIImageView! {set get}
    var titleLabel: UILabel! {set get}
    var genreLabel: UILabel! {set get}
    var synopsisLabel: UILabel! {set get}
    var artistsLabel: UILabel! {set get}
    var startButton: UIButton! {set get}
}

extension MovieViewPresentable {
    func map(item: MoviePresentable?) {
        guard let movie = item else { return }
        titleLabel.text = movie.titleText

        if let imageURL = movie.imageURL {
            movieImageView?.imageFromURL(url: imageURL)
        } else {
            movieImageView?.image = nil
        }
        
        
        
        
        //Genre Label
        let genreName = "Genre: "
        let genreText = genreName + movie.genresText
        let genreAttrStr = NSMutableAttributedString(string: genreText)
        genreAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.textLabel)!,
                                    .font: UIFont.boldBody],
                                   range: (genreText as NSString).range(of: genreName))
        
        genreAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.subTextLabel)!,
                                    .font: UIFont.body],
                                   range: (genreText as NSString).range(of: movie.genresText))
        genreLabel.attributedText = genreAttrStr
        
        
        //Synopsis Label
        let synopsisName = "Synopsis: "
        let synopsisText = synopsisName + movie.synopsisText
        let synopsisAttrStr = NSMutableAttributedString(string: synopsisText)
        synopsisAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.textLabel)!,
                                    .font: UIFont.boldBody],
                                   range: (synopsisText as NSString).range(of: synopsisName))
        
        synopsisAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.subTextLabel)!,
                                    .font: UIFont.body],
                                   range: (synopsisText as NSString).range(of: movie.synopsisText))
        synopsisLabel.attributedText = synopsisAttrStr
        
        //Artists Label
        let artistsName = "Artists: "
        let artistsText = artistsName + movie.artistNames
        let artistsAttrStr = NSMutableAttributedString(string: artistsText)
        artistsAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.textLabel)!,
                                    .font: UIFont.boldBody],
                                   range: (artistsText as NSString).range(of: artistsName))
        
        artistsAttrStr.addAttributes([.foregroundColor: UIColor.assetColor(.subTextLabel)!,
                                    .font: UIFont.body],
                                   range: (artistsText as NSString).range(of: movie.artistNames))
        artistsLabel.attributedText = artistsAttrStr
        
    }
}
