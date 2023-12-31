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

/// View Model для ячейки персонажа на MainViewController
class PersonageTableCellViewModel {
    var personage: Personage
    var name: String
    var status: String
    var gender: String
    var imageURL: URL?
    var statusLabelTextColor: UIColor = .lightGray
    
    init(personage: Personage) {
        self.personage = personage
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
