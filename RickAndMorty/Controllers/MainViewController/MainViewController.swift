////   /*
//
//  Project: RickAndMorty
//  File: ViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()
    
    var viewModel: MainViewModel = MainViewModel()
    var cellDataSource: [PersonageTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }

    func configView() {
        title = "Characters"
        view.backgroundColor = .mainBackgroundColor
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
}

