//
//  HomeViewModel.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import Combine


enum ViewModelState {
    case none
    case stop
    case loading
    case error(Error)
}

class HomeViewModel {
    @Published private(set) var movies: [OverviewMovie] = []
    @Published private(set) var state: ViewModelState = .none
    @Published private(set) var showMovieId: UInt?
    
    private var apiProvider: HooplaProvider<HooplaAPI>

    init(apiProvider: HooplaProvider<HooplaAPI> = HooplaProvider<HooplaAPI>()) {
        self.apiProvider = apiProvider
    }
    
    //MARK: - Public functions
    func fetchData() {
        state = .loading
        apiProvider.request(.topMovies) { [weak self] (result: Result<[OverviewMovie], HooplaError>) in
            switch result {
            case .failure(let error):
                self?.state = .error(error)
            case .success(let movies):
                self?.movies = movies
                self?.state = .stop
            }
        }
    }

    //MARK: - Private functions
    private func reset() {
        state = .stop
        movies = []
    }
}

//MARK:
extension HomeViewModel: ListOverviewMovieProtocol {
    var items: [OverviewMoviePresentable] {
        return movies
    }
    
    func itemSelected(at: IndexPath) {
        guard let movie = item(at: at) else { return }
        showMovieId = movie.id
    }
}
