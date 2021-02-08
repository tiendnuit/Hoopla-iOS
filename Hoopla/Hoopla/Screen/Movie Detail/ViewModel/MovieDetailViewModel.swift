//
//  MovieDetailViewModel.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import Combine

class MovieDetailViewModel {
    @Published internal var state: ViewModelState = .none
    @Published internal var movie: Movie?
    @Published private(set) var dismissed: Bool = false
    
    private let movieId: UInt
    private var apiProvider: HooplaProvider<HooplaAPI>
    internal var bindings = Set<AnyCancellable>()
    
    init(movieId: UInt, apiProvider: HooplaProvider<HooplaAPI> = HooplaProvider<HooplaAPI>()) {
        self.movieId = movieId
        self.apiProvider = apiProvider
        fetchDetail()
    }
    
    func fetchDetail() {
        state = .loading
        apiProvider.request(.detailMovie(id: movieId)) { [weak self] (result: Result<Movie, HooplaError>) in
            switch result {
            case .failure(let error):
                self?.state = .error(error)
            case .success(let movie):
                self?.movie = movie
                self?.state = .stop
            }
        }
    }
    
    func dismiss() {
        dismissed = true
    }
}
