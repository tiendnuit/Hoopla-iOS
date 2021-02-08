//
//  Configurable.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
protocol UIViewControllerConfigurable {
    func setupComponents()
    func bindViewModel()
    func updateUI()
}

protocol Configurable {
    func configure(_ item: Any)
}
