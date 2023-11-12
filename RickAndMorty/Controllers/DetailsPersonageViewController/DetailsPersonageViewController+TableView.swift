////   /*
//
//  Project: RickAndMorty
//  File: DetailsPersonageViewController+TableView.swift
//  Created by: Robert Bikmurzin
//  Date: 16.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit

extension DetailsPersonageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear        
        tableView.showsVerticalScrollIndicator = false
        
        tableView.separatorStyle = .none
        self.registerCells()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells() {
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier, for: indexPath) as? EpisodeCell else {
            return UITableViewCell()
        }
        let cellViewModel = self.cellDataSource[indexPath.row]
        cell.setupData(viewModel: cellViewModel)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
