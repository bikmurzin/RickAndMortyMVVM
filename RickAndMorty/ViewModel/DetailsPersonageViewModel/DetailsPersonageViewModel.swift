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
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[EpisodeTableCellViewModel]> = Observable(nil)
    
    init(personage: Personage) {
        self.personage = personage
        self.imageURL = URL(string: personage.imageURL ?? "")
    }
    
    func numberOfRows() -> Int {
        cellDataSource.value?.count ?? 0
    }
    
    func getData() {
        guard let episodeURLs = personage.episode else { return }
        isLoading.value = true
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "queue")
        var episodeCellViewModels: [EpisodeTableCellViewModel] = []
        
        for episodeURL in episodeURLs {
            group.enter()
            queue.async {
                APICaller.makeRequest(urlString: episodeURL) { [weak self] (result: Result<Episode, NetworkError>) in
                    group.leave()
                    switch result {
                    case .success(let episode):
                        episodeCellViewModels.append(EpisodeTableCellViewModel(episode: episode))
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        group.wait()
        cellDataSource.value = episodeCellViewModels
        isLoading.value = false
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
