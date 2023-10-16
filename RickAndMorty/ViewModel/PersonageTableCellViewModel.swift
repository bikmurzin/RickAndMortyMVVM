////   /*
//
//  Project: RickAndMorty
//  File: PersonageTableCellViewModel.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit

class PersonageTableCellViewModel {
    var name: String
    var status: String
    var gender: String
    var imageURL: URL?
    var statusLabelTextColor: UIColor = .lightGray
    
    init(personage: Personage) {
        self.name = personage.name ?? "Unknown"
        self.status = personage.status ?? "Unknown"
        self.gender = personage.gender ?? "Unknown"
        self.imageURL = URL(string: personage.imageURL ?? "")
        if self.status == "Alive" {
            statusLabelTextColor = .green
        } else if self.status == "Dead"  {
            statusLabelTextColor = .red
        }
    }
}
