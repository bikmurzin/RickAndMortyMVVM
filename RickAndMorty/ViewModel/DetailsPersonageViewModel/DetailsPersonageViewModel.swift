////   /*
//
//  Project: RickAndMorty
//  File: DetailsPersonageViewModel.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

/// ViewModel для DetailsPersonageViewController
class DetailsPersonageViewModel {
    private var personage: Personage
    private var episodes: [Episode] = []
    private var imageURL: URL?

    /// Источник данных для ячеек
    var cellDataSource: Observable<[EpisodeTableCellViewModel]> = Observable(nil)
    
    init(personage: Personage) {
        self.personage = personage
        self.imageURL = URL(string: personage.imageURL ?? "")
    }
    
    func numberOfRows() -> Int {
        cellDataSource.value?.count ?? 0
    }
    
    func getData() {
        guard let episodeURLs = personage.episode else {
            return
        }
        
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "queue")
        
        var episodeCellViewModels: [EpisodeTableCellViewModel] = []
        for episodeURL in episodeURLs {
            group.enter()
            queue.async {
                APICaller.makeRequest(urlString: episodeURL) { (result: Result<Episode, NetworkError>) in
                    switch result {
                    case .success(let episode):
                        episodeCellViewModels.append(EpisodeTableCellViewModel(episode: episode))
                        group.leave()
                    case .failure(let error):
                        print(error)
                        group.leave()
                    }
                }
            }
        }
        group.wait()
        cellDataSource.value = episodeCellViewModels
    }
    
    func personageName() -> String {
        return personage.name ?? ""
    }
    
    func personageStatus() -> String {
        return personage.status ?? ""
    }
    
    func personageImageURL() -> URL? {
        return imageURL
    }
    
    func personageSpecies() -> String {
        personage.species ?? "None"
    }
    
    func personageType() -> String {
        personage.type ?? "None"
    }
    
    func personageGender() -> String {
        personage.gender ?? "None"
    }
    
}
