//
//  HomeViewController.swift
//  Hoopla
//
//  Created by Scor Doan on 04/02/2021.
//

import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController, UIViewControllerConfigurable, Storyboarded {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: ListMovieDataSource!
    var viewModel: HomeViewModel = HomeViewModel()
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        bindViewModel()
        updateUI()
    }
    
    
    func setupComponents() {
        title = "Hoopla"
        view.backgroundColor = UIColor.assetColor(.primaryBackground)
        dataSource = ListMovieDataSource(delegate: viewModel)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.register(UINib(nibName: OverviewMovieViewCell.typeName, bundle: nil), forCellWithReuseIdentifier: OverviewMovieViewCell.typeName)
        
    }

    func bindViewModel() {
        func bindViewModelToView() {
            let reloadHandler: ([Any]) -> Void = { [weak self] _ in
                self?.collectionView.reloadData()
            }

            viewModel.$movies
                .receive(on: RunLoop.main)
                .sink(receiveValue: reloadHandler)
                .store(in: &bindings)

            let stateHandler: (ViewModelState) -> Void = { state in
                switch state {
                case .loading:
                    print("loading....")
                case .error(let error):
                    print("error....\(error)")
                default:
                    print("stop....")
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }

        bindViewModelToView()
        viewModel.fetchData()
    }
    
    func updateUI() {
    }
    
}
