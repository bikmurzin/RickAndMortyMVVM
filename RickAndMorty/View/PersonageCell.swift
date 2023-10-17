////   /*
//
//  Project: RickAndMorty
//  File: MainPersonageCell.swift
//  Created by: Robert Bikmurzin
//  Date: 14.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import SnapKit
import SDWebImage

class PersonageCell: BaseTableViewCell {

    public static var identifier: String {
        get {
            return "MainPersonageCell"
        }
    }
    var personageImage = UIImageView()
    var nameLabel = UILabel()
    var genderLabel = UILabel()
    var statusLabel = UILabel()
    var nameTitle = UILabel()
    var statusTitle = UILabel()
    var genderTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backView.addSubviews([personageImage, nameLabel, genderLabel, statusLabel])
        personageImage.round()
        personageImage.snp.makeConstraints { make in
            make.leading.equalTo(backView.snp.leading).inset(16)
            make.centerY.equalTo(backView.snp.centerY)
            make.width.height.equalTo(backView.snp.height).offset(-32)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY)
            make.trailing.equalTo(backView.snp.trailing).inset(16)
            make.leading.equalTo(personageImage.snp.trailing).offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(20)
            make.trailing.equalTo(statusLabel.snp.trailing)
            make.leading.equalTo(personageImage.snp.trailing).offset(16)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backView.snp.bottom).inset(20)
            make.trailing.equalTo(statusLabel.snp.trailing)
            make.leading.equalTo(personageImage.snp.trailing).offset(16)
        }
    }
    
    func setupData(viewModel: PersonageTableCellViewModel) {
        nameLabel.text = viewModel.name
        genderLabel.text = viewModel.gender
        statusLabel.text = viewModel.status
        personageImage.sd_setImage(with: viewModel.imageURL)
        
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        genderLabel.textColor = .white
        statusLabel.textColor = viewModel.statusLabelTextColor
        nameTitle.textColor = .lightGray
        statusTitle.textColor = .lightGray
        genderTitle.textColor = .lightGray
    }
}
