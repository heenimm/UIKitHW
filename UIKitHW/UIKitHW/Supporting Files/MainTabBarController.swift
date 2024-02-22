// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let titleFeedNews = "Лента"
    static let titleNotification = "Уведомления"
    static let titleProfile = "Профиль"
}

/// Конфигурирование главного таббара
final class MainTabBarController: UITabBarController {
    // MARK: - Static Properties

    static func configureTabBarController() -> UITabBarController {
        let feedNewsViewController = FeedNewsViewController()
        let feedNewsViewNavigationController = UINavigationController(rootViewController: feedNewsViewController)
        let notificationViewController = NotificationViewController()
        let profileViewController = ProfileViewController()

        feedNewsViewNavigationController.tabBarItem = UITabBarItem(
            title: Constants.titleFeedNews,
            image: UIImage(systemName: "house"),
            tag: 0
        )
        notificationViewController.tabBarItem = UITabBarItem(
            title: Constants.titleNotification,
            image: UIImage(systemName: "message.badge"),
            tag: 1
        )
        profileViewController.tabBarItem = UITabBarItem(
            title: Constants.titleProfile,
            image: UIImage(systemName: "person"),
            tag: 2
        )
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(
            [
                feedNewsViewNavigationController,
                notificationViewController,
                profileViewController
            ],
            animated: true
        )
        tabBarController.selectedIndex = 0
        return tabBarController
    }
}
