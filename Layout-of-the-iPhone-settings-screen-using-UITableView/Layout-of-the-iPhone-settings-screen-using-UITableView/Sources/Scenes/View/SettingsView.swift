//
//  SettingsView.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 04.07.2022.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    private var models = [Section]()

    // MARK: - Configure view

    func configure(with models: [Section]) {
        self.models = models
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.dataSource = self
        table.delegate = self
        
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifire)
        
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifire)
        
        table.register(SettingSomeInfoOption.self,
                       forCellReuseIdentifier: SettingSomeInfoOption.identifire)
        
        table.register(SettingTableFigure.self,
                       forCellReuseIdentifier: SettingTableFigure.identifire)
        
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "reuseIdentifier")

        return table
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(tableView)
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

//MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource {
    
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
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifire,
                                                           for: indexPath) as? SwitchTableViewCell
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .someInfoCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingSomeInfoOption.identifire,
                                                           for: indexPath) as? SettingSomeInfoOption
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .notificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableFigure.identifire,
                                                           for: indexPath) as? SettingTableFigure
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
            
        case .switchCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
            
        case .someInfoCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
            
        case .notificationCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
        }
    }
}
