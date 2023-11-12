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

/// View Model для MainViewController
class MainViewModel {
    /// Флаг, отображающий, идет ли сейчас загрузка
    var isLoading: Observable<Bool> = Observable(false)
    /// Источник данных для ячеек
    var cellDataSource: Observable<[PersonageTableCellViewModel]> = Observable(nil)
    // Источник данных для View Model
    var dataSource: CharactersModel?
    private var characterURL = NetworkConstant.shared.characterURL
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.cellDataSource.value?.count ?? 0
    }
    
    /// Загружает следующую страницу персонажей
    func loadNextPage() {
        guard let stringURL = dataSource?.info.next else { return }
        if self.characterURL != stringURL {
            self.characterURL = stringURL
            self.getData()
        }
    }
    
    /// Выполняет запрос по URL, который хранится в characterURL. При успешной загруке заполняет массив cellDataSource
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
    
    /// Заполняет массив cellDataSource
    func mapCellData() {
        if let unwrCellViewModels = self.dataSource?.personages.compactMap({PersonageTableCellViewModel(personage: $0)}) {
            // Если массив не пустой, то добавляем в него новые элементы. Иначе - присваиваем ему массив с новыми элементами
            if cellDataSource.value != nil {
                cellDataSource.value?.append(contentsOf: unwrCellViewModels)
            } else {
                cellDataSource.value = unwrCellViewModels
            }
        }
    }
}
