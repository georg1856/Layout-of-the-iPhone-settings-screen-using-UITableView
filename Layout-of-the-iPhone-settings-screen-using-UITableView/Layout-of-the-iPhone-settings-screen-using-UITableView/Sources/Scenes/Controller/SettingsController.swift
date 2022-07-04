//
//  SettingsController.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 04.07.2022.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()
        model = SettingsModel()

        configureView()
    }
}

private extension SettingsController {
    func configureView() {
        title = "Настройки"
        
        guard let models = model?.createModels() else { return }
        settingsView?.configure(with: models)
    }
}
