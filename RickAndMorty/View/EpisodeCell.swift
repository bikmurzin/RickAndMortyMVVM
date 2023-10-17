////   /*
//
//  Project: RickAndMorty
//  File: EpisodeCell.swift
//  Created by: Robert Bikmurzin
//  Date: 16.10.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import SnapKit

class EpisodeCell: BaseTableViewCell {
    
    var episodeNameLabel = UILabel()
    var seriesAndSeasonLabel = UILabel()
    var airDateLabel = UILabel()

    public static var identifier: String {
        get {
            return "EpisodeCell"
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backView.addSubviews([episodeNameLabel, seriesAndSeasonLabel, airDateLabel])
        episodeNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
        }
        seriesAndSeasonLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(16)
        }
        airDateLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setupLabels() {
        // Color:
        episodeNameLabel.textColor = .white
        seriesAndSeasonLabel.textColor = .greenTextColor
        airDateLabel.textColor = .grayTextColor
        // Font:
        episodeNameLabel.font = .systemFont(ofSize: 17)
        seriesAndSeasonLabel.font = .systemFont(ofSize: 13)
        airDateLabel.font = .systemFont(ofSize: 12)
        // Lines Number:
        episodeNameLabel.numberOfLines = 0
    }
    
    func setupData(viewModel: EpisodeTableCellViewModel) {
        episodeNameLabel.text = viewModel.episodeName
        seriesAndSeasonLabel.text = viewModel.seriesAndSeason()
        airDateLabel.text = viewModel.airDate
    }
}
