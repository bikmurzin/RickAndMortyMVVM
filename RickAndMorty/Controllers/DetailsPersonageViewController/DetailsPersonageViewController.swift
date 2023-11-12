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
    // MARK: UI
    var tableView = UITableView()
    
    // MARK: View Models
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
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.verticalEdges.equalToSuperview()
        }
        setupTableView()
    }
    
    /// Выполняет привязку замыканий для наблюдаемых свойств viewModel
    func bindViewModel() {
        viewModel.cellDataSource.bind { [weak self] cellsViewModels in
            guard let self = self, let cellsViewModels = cellsViewModels else {
                return
            }
            self.cellDataSource = cellsViewModels
            self.reloadTableView()
        }
    }
}
