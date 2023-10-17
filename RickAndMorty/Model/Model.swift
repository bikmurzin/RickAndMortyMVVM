////   /*
//
//  Project: RickAndMorty
//  File: Model.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

struct CharactersModel: Decodable {
    var info: Info
    var personages: [Personage]
    
    enum CodingKeys: String, CodingKey {
        case info
        case personages = "results"
    }
}

struct Info: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Personage: Decodable {
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var imageURL: String?
    var episode: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name, status, species, type, gender, origin, location, episode
        case imageURL = "image"
    }
}

struct Origin: Decodable {
    var name: String
    var url: String
}

struct Location: Decodable {
    var id: Int?
    var name: String?
    var type: String?
    var url: String?
}

struct Episode: Decodable, Identifiable {
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode
        case airDate = "air_date"
    }
}

