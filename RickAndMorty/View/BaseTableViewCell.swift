////   /*
//
//  Project: RickAndMorty
//  File: BaseTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 16.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell {

    var backView = UIView(frame: CGRect.zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.round()
        backgroundColor = .clear
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        backView.backgroundColor = .elementColor
        backView.round()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
