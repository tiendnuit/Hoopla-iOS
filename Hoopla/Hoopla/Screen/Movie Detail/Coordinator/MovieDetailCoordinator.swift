//
//  MovieDetailCoordinator.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit
import Combine

protocol MovieDetailCoordinatorDelegate: class {
    func requestDismissal()
}

class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var bindings = Set<AnyCancellable>()
    private var movieId: UInt!
    weak var coordinatorDelegate: MovieDetailCoordinatorDelegate?

    init(navigationController: UINavigationController, movieId: UInt) {
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    func start() {
        let viewModel = MovieDetailViewModel(movieId: movieId)
        viewModel.$dismissed
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] dismissed in
                if dismissed {
                    self?.coordinatorDelegate?.requestDismissal()
                }
            })
            .store(in: &bindings)
        
        let vc = MovieDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
