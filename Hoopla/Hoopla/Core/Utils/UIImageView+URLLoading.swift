//
//  UIImageView+URLLoading.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromURL(url: URL) {
        let loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        loadingView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        loadingView.startAnimating()
        if self.image == nil{
            self.addSubview(loadingView)
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let data = data else {
                print(error ?? "Unable to load image!")
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                loadingView.removeFromSuperview()
                self.image = image
            }

        }).resume()
    }
}
