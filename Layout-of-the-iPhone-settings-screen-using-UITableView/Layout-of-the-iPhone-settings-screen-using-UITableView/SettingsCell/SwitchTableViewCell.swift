//
//  SwitchTableViewCell.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 02.06.2022.
//

import Foundation
import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identifire = "SwitchTableViewCell"
    
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
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = Metric.mySwitchColor
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .none
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
        
        let imageSize: CGFloat = size / 1.75
        iconImageView.frame = CGRect(x: (size - imageSize) / 2,
                                     y: (size - imageSize) / 2,
                                     width: imageSize,
                                     height: imageSize)
        
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.width - 20,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height) / 2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
        
        label.frame = CGRect(x: Metric.labelFrameX + iconContainer.frame.size.width,
                             y: Metric.labelFrameY,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height
        )
    }
    
    public func configure(with model: SettingsSwitchOption){
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
        mySwitch.isOn = model.isOn
    }
}

extension SwitchTableViewCell {
    enum Metric {
        static var cornerRadius: CGFloat = 8
        static var tintColor = UIColor.white
        static var numberOfLines = 1
        static var iconContainerFrameX: CGFloat = 12
        static var iconContainerFrameY: CGFloat = 6
        static var labelFrameX: CGFloat = 25
        static var labelFrameY: CGFloat = 0
        static var mySwitchColor = UIColor.systemGreen
    }
}
