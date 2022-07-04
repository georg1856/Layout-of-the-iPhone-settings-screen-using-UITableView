//
//  SceneDelegate.swift
//  Layout-of-the-iPhone-settings-screen-using-UITableView
//
//  Created by Georgiy on 02.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let navigationContoller = UINavigationController(rootViewController: SettingsController())

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationContoller.navigationBar.scrollEdgeAppearance = navigationBarAppearance

        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
