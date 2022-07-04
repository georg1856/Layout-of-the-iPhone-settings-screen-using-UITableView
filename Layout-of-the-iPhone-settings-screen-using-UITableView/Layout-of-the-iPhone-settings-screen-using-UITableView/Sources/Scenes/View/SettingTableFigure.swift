//
//  SettingTableFigure.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 02.06.2022.
//

import Foundation
import UIKit

class SettingTableFigure: UITableViewCell {
    
    static let identifire = "SettingTableFigure"

    // MARK: - Views
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Metric.tintColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = Metric.numberOfLines
        return label
    }()
    
    private var labelInfo: UILabel = {
        let labelInfo = UILabel()
        labelInfo.textColor = Metric.tintColor
        labelInfo.layer.masksToBounds = true
        labelInfo.sizeToFit()
        labelInfo.font = .systemFont(ofSize: Metric.labelInfoFont)
        
        labelInfo.layer.cornerRadius = labelInfo.frame.width/2
        labelInfo.textAlignment = .center
        labelInfo.backgroundColor = Metric.labelInfoBackgroundColor
        return labelInfo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(labelInfo)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: Metric.iconContainerFrameX,
                                     y: Metric.iconContainerFrameY,
                                     width: size,
                                     height: size)

        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2,
                                     y: (size - imageSize) / 2,
                                     width: imageSize,
                                     height: imageSize)

        labelInfo.layer.cornerRadius = Metric.labelInfoCornerRadius

        labelInfo.frame = CGRect(x: Metric.labelInfoFrameX + iconContainer.frame.size.width + 260,
                                 y: Metric.labelInfoFrameY,
                                 width: Metric.labelInfoWidth,
                                 height: Metric.labelInfoHeight)

        label.frame = CGRect(x: Metric.labelFrameX + iconContainer.frame.size.width,
                             y: Metric.labelFrameY,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    // MARK: - Configuration

    func configure(with model: SettingNotification){
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
        labelInfo.text = model.titleInfo
    }
}

extension SettingTableFigure {
    
    enum Metric {
        static var cornerRadius: CGFloat = 8
        static var labelInfoCornerRadius: CGFloat = 10
        
        static var tintColor = UIColor.white
        static var labelInfoBackgroundColor = UIColor.red

        static var labelInfoFont: CGFloat = 15
        static var numberOfLines = 1
        
        static var iconContainerFrameX: CGFloat = 12
        static var iconContainerFrameY: CGFloat = 6
        static var labelFrameX: CGFloat = 25
        static var labelFrameY: CGFloat = 0
        
        static var labelInfoFrameX: CGFloat = 25
        static var labelInfoFrameY: CGFloat = 12
        static var labelInfoWidth: CGFloat = 20
        static var labelInfoHeight: CGFloat = 20
    }
}
