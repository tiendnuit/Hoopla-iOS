//
//  Coordinator.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
