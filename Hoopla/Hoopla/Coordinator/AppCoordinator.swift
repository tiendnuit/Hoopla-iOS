//
//  AppCoordinator.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import UIKit
import Combine

class AppCoordinator: Coordinator {
    private var window: UIWindow?
    private var homeViewModel: HomeViewModel?
    
    var navigationController = UINavigationController()
    var childCoordinator: Coordinator? = nil
    private var bindings = Set<AnyCancellable>()
    
    init(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        showHomePage()
    }
    
    func showHomePage() {
        let viewModel = HomeViewModel()
        let homePage = HomeViewController.instantiate(of: .main)
        homePage.viewModel = viewModel
        homeViewModel = viewModel
        homeViewModel?.$showMovieId
                .receive(on: RunLoop.main)
                .sink { [weak self] (movieId) in
                self?.showMovie(movieId)
            }.store(in: &bindings)
        navigationController.viewControllers = [homePage]
    }
    
    func showMovie(_ id: UInt?) {
        guard let id = id else { return }
        let detailCoordinator = MovieDetailCoordinator(navigationController: navigationController,
                                                       movieId: id)
        detailCoordinator.coordinatorDelegate = self
        childCoordinator = detailCoordinator
        detailCoordinator.start()
    }
    
}

//MARK: - MovieDetailCoordinatorDelegate
extension AppCoordinator: MovieDetailCoordinatorDelegate {
    func requestDismissal() {
        navigationController.popViewController(animated: true)
        childCoordinator = nil
    }


}
