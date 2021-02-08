//
//  MovieDetailViewController.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit
import Combine

class MovieDetailViewController: UIViewController, UIViewControllerConfigurable, MovieViewPresentable {
    var movieImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.assetColor(.placeholder)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = CGFloat.thumbnailRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.textLabel)
        label.font = UIFont.title
        label.numberOfLines = 0
        return label
    }()
    
    var genreLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.subTextLabel)
        label.font = UIFont.subText
        label.numberOfLines = 0
        return label
    }()
    
    var synopsisLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.subTextLabel)
        label.font = UIFont.subText
        label.numberOfLines = 0
        return label
    }()
    
    var artistsLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.subTextLabel)
        label.font = UIFont.subText
        label.numberOfLines = 0
        return label
    }()
    
    var startButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = CGFloat.defaultRadius
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldBody
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.assetColor(.navigationTitle)
        button.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        return button
    }()
    
    //Stackview
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat.defaultComponentsSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var viewModel: MovieDetailViewModel!
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        constraintsInit()
        bindViewModel()
        updateUI()
    }
    
    func setupComponents() {
        view.backgroundColor = UIColor.assetColor(.primaryBackground)
        view.addSubview(containerStackView)
        addCloseButton(with: "Back")
        
        containerStackView.addArrangedSubview(movieImageView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(genreLabel)
        containerStackView.addArrangedSubview(synopsisLabel)
        containerStackView.addArrangedSubview(artistsLabel)
        containerStackView.addArrangedSubview(startButton)
    }
    
    
    func constraintsInit() {
        //Constraints
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.defaultSpacing),
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.defaultSpacing),
            movieImageView.heightAnchor.constraint(equalToConstant: CGFloat.thumbnailHeight),
            startButton.heightAnchor.constraint(equalToConstant: CGFloat.buttonHeight)
        ])
    }
    
    override func closeTapped() {
        viewModel.dismiss()
    }
    
    func bindViewModel() {
        func bindViewModelToView() {
            let updateHandler: (Movie?) -> Void = { [weak self] movie in
                self?.updateUI()
            }
            
            let stateHandler: (ViewModelState) -> Void = { state in
                switch state {
                case .loading:
                    print("loading....")
                case .stop:
                    print("stop....")
                    
                case .error(let error):
                    print("error....\(error)")
                default:
                    print("none")
                }
            }

            viewModel.$movie
                .receive(on: RunLoop.main)
                .sink(receiveValue: updateHandler)
                .store(in: &bindings)
            
            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }

        bindViewModelToView()
    }
    
    func updateUI() {
        map(item: viewModel.movie)
        title = viewModel.movie?.title
    }
    
    @objc func startButtonClicked() {
        guard let title = viewModel.movie?.title else { return }
        UIAlertController.presentOKAlertWithTitle("Start watching \(title)", message: nil)
    }
}
