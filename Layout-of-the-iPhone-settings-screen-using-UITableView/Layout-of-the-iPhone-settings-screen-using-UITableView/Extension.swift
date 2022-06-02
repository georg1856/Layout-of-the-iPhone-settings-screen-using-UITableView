//
//  Extension.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 02.06.2022.
//

import Foundation
import UIKit

struct Section {
    let option: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case someInfoCell(model: SettingInfo)
    case notificationCell(model: SettingNotification)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var isOn: Bool
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingInfo {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var titleInfo: String
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingNotification {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var titleInfo: String
    let handler: ((_ doubleHeader: String) -> Void)
}

extension ViewController {

    enum CellTitle: String {
        case sectionOneCellOne = "Авиарежим"
        case sectionOneCellTwo = "Wi-Fi"
        case sectionOneCellThree = "Bluetooth"
        case sectionOneCellFour = "Сотовая связь"
        case sectionOneCellFive = "Режим модема"
        case sectionOneCellSix = "VPN"
        
        case sectionTwoCellOne = "Уведомления"
        case sectionTwoCellTwo = "Звуки, тактильные сигналы"
        case sectionTwoCellThree = "Не беспокоить"
        case sectionTwoCellFour = "Экранное время"
        
        case sectionThreeCellOne = "Основные"
        case sectionThreeCellTwo = "Пункт управления"
        case sectionThreeCellThree = "Экран и яркость"
        case sectionThreeCellFour = "Экран «Домой»"
        case sectionThreeCellFive = "Универсальный доступ"
    }
    
    enum Image: String {
        case sectionOneCellOne = "airplane"
        case sectionOneCellTwo = "wifi"
        case sectionOneCellThree = "bluetooth"
        case sectionOneCellFour = "antenna.radiowaves.left.and.right"
        case sectionOneCellFive = "personalhotspot"
        case sectionOneCellSix = "vpn"

        case sectionTwoCellOne = "app.badge"
        case sectionTwoCellTwo = "speaker.wave.3.fill"
        case sectionTwoCellThree = "moon.fill"
        case sectionTwoCellFour = "hourglass"

        case sectionThreeCellOne = "gear"
        case sectionThreeCellTwo = "switch.2"
        case sectionThreeCellThree = "character"
        case sectionThreeCellFour = "house.circle"
        case sectionThreeCellFive = "figure.walk.circle"
    }
    
    enum Color {
        static var firstColor = UIColor.systemOrange
        static var secondColor = UIColor.systemBlue
        static var thirdColor = UIColor.systemGreen
        static var fourColor = UIColor.link
        static var fiveColor = UIColor.systemPink
        static var sixColor = UIColor.systemGray
        static var sevenColor = UIColor.blue
    }
}
