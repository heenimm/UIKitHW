// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = configureTabBarController()
        window.makeKeyAndVisible()
    }

    private func configureTabBarController() -> UITabBarController {
        let feedNewsViewController = FeedNewsViewController()
        let notificationViewController = NotificationViewController()
        let profileViewController = ProfileViewController()
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(
            [
                feedNewsViewController,
                notificationViewController,
                profileViewController
            ],
            animated: true
        )
        tabBarController.selectedIndex = 1
//        tabBarController.tabBar.unselectedItemTintColor = UIColor(red: 0.7, green: 0.5, blue: 0.5, alpha: 1)
        return tabBarController
    }
}
