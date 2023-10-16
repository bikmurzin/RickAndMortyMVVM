////   /*
//
//  Project: RickAndMorty
//  File: APICaller.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    static func makeRequest<T: Decodable>(urlString: String,
        completionHandler: @escaping (_ result: Result<T, NetworkError>) -> Void
    ) {
        guard let url =  URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(T.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}

