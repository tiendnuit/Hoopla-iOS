//
//  Storyboarded.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import UIKit

enum StoryboardType: String {
    case main
}

protocol Storyboarded {
    static func instantiate(of: StoryboardType) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(of storyboard: StoryboardType) -> Self {
        let pathName = NSStringFromClass(self)
        let className = pathName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue.capitalized, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
