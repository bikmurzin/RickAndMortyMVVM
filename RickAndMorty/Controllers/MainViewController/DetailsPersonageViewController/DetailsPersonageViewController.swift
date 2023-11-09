////   /*
//
//  Project: RickAndMorty
//  File: DetailsPersonageViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 16.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import SnapKit
import SDWebImage

class DetailsPersonageViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    var tableView = UITableView()
    
    // View Model:
    var viewModel: DetailsPersonageViewModel
    var cellDataSource: [EpisodeTableCellViewModel] = []
    
    init(viewModel: DetailsPersonageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.getData()
    }
    
    func configView() {
        title = "Episodes"
        view.backgroundColor = .mainBackgroundColor
        view.addSubviews([tableView, activityIndicator])
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.verticalEdges.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.style = .large
        activityIndicator.color = .white
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] cellsViewModels in
            guard let self = self, let cellsViewModels = cellsViewModels else {
                return
            }
            self.cellDataSource = cellsViewModels
            self.reloadTableView()
        }
    }
}
