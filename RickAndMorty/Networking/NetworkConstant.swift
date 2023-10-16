////   /*
//
//  Project: RickAndMorty
//  File: NetworkConstant.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singletone
    }
    
    private var serverAddress: String {
        get {
            return "https://rickandmortyapi.com/api/"
        }
    }
    
    public var characterURL: String {
        return serverAddress + "character"
    }
    
    public var locationURL: String {
        return serverAddress + "location"
    }

    public var episodeURL: String {
        return serverAddress + "episode"
    }

}
