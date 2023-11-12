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
import SnapKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()
    
    var viewModel: MainViewModel = MainViewModel()
    /// Массив источников данных для каждой ячейки
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
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.style = .large
        activityIndicator.color = .white
    }
    /// Выполняет привязку замыканий для наблюдаемых свойств viewModel
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
    
    /// Выполняет переход на DetailsPersonageViewController для выбранного персонажа
    func openDetails(personageId: Int) {
        guard let personageViewModel = viewModel.cellDataSource.value?[personageId] else {
            return
        }
        let detailsViewModel = DetailsPersonageViewModel(personage: personageViewModel.personage)
        let detailsController = DetailsPersonageViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

