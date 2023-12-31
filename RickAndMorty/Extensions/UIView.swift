////   /*
//
//  Project: RickAndMorty
//  File: UIView.swift
//  Created by: Robert Bikmurzin
//  Date: 15.10.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import UIKit

extension UIView {
    /// Устанавливает cornerRadius для view. По умолчанию radius = 10
    func round( _ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        // Если true, то subviews не выходят за границы view
        self.clipsToBounds = true
    }
    /// Добавляет белую тень и cornerRadius = 10 для view
    func addWhiteShadow() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    /// Позволяет добавить массив subviews
    func addSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
