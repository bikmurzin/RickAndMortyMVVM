////   /*
//
//  Project: RickAndMorty
//  File: MainViewModel.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

class MainViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[PersonageTableCellViewModel]> = Observable(nil)
    var dataSource: CharactersModel?
    private var characterURL = NetworkConstant.shared.characterURL
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.cellDataSource.value?.count ?? 0
    }
    
    func loadNextPage() {
        guard let stringURL = dataSource?.info.next else { return }
        if self.characterURL != stringURL {
            self.characterURL = stringURL
            self.getData()
        }
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.makeRequest(urlString: characterURL) { [weak self] (result: Result<CharactersModel, NetworkError>) in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        if let unwrCellViewModels = self.dataSource?.personages.compactMap({PersonageTableCellViewModel(personage: $0)}) {
            // Если массив не пустой, то добавляем в него новые элементы. Иначе - присваиваем ему массив с новыми элементами
            if cellDataSource.value != nil {
                cellDataSource.value?.append(contentsOf: unwrCellViewModels)
            } else {
                cellDataSource.value = unwrCellViewModels
            }
        } else {
            
        }
    }
}
