//
//  ViewController.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 02.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifire)
        
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "reuseIdentifier")
        
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(option: [
            .staticCell(model: SettingsOption(title: CellTitle.sectionOneCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionOneCellFour.rawValue),
                                             iconBackgroungColor: Color.thirdColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model: SettingsOption(title: CellTitle.sectionOneCellFive.rawValue, icon:
                                              UIImage(systemName: Image.sectionOneCellFive.rawValue),
                                              iconBackgroungColor: Color.thirdColor)
                                              { print("Нажата ячейка \($0)") })
        ]))
        
        models.append(Section(option: [
            .staticCell(model: SettingsOption(title: CellTitle.sectionTwoCellOne.rawValue,
                                              icon: UIImage(systemName: Image.sectionTwoCellOne.rawValue),
                                              iconBackgroungColor: Color.fiveColor)
                                              { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellTwo.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellTwo.rawValue),
                                             iconBackgroungColor: Color.fiveColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellThree.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellThree.rawValue),
                                             iconBackgroungColor: Color.sevenColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellFour.rawValue),
                                             iconBackgroungColor: Color.sevenColor)
                                             { print("Нажата ячейка \($0)") })
        ]))
        
        models.append(Section(option: [
            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellTwo.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellTwo.rawValue),
                                             iconBackgroungColor: .systemGray)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellThree.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellThree.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellFour.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellFive.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellFive.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") })
        ]))
        
        
    
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifire,
                                                           for: indexPath) as? SettingTableViewCell
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .switchCell(model: let model):
            <#code#>
        case .someInfoCell(model: let model):
            <#code#>
        case .notificationCell(model: let model):
            <#code#>
        }
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
        case .switchCell(model: let model):
            <#code#>
        case .someInfoCell(model: let model):
            <#code#>
        case .notificationCell(model: let model):
            <#code#>
        }
    }
}

