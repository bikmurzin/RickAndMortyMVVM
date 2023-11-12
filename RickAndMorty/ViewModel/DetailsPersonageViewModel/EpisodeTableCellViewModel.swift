////   /*
//
//  Project: RickAndMorty
//  File: EpisodeTableCellViewModel.swift
//  Created by: Robert Bikmurzin
//  Date: 16.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

/// ViewModel для ячейки с эпизодом на DetailsPersonageViewController
class EpisodeTableCellViewModel {
    var episodeName: String
    var airDate: String
    private var episodeNumber: String
    
    init(episode: Episode) {
        episodeName = episode.name
        airDate = episode.airDate
        self.episodeNumber = episode.episode
    }
    
    func seriesAndSeason() -> String {
        let episodeParsingResult = episodeParsing(stringToParsing: episodeNumber)
        return "Episode: \(episodeParsingResult.1), Season: \(episodeParsingResult.0)"
    }
    
    func episodeParsing(stringToParsing: String) -> (Int, Int) {
        if let episodeIndex = stringToParsing.firstIndex(of: "E") {
            var seasonString = stringToParsing[..<episodeIndex]
            var episodeString = stringToParsing[episodeIndex...]
            seasonString.removeFirst()
            episodeString.removeFirst()
            if let unwrSeasonNumber = Int(seasonString),
               let unwrEpisodeNumber = Int(episodeString) {
                return (unwrSeasonNumber, unwrEpisodeNumber)
            }
        }
        return (0, 0)
    }
}
