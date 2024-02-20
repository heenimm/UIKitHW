// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let notifications = "Уведомления"
    static let cardImage = "card"
    static let fontVerdana = "Verdana-Bold"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
    static let feedBack = "Обратная связь"
}

/// В данном классе отображаются уведомления о подписках
final class NotificationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
    }

    override func viewDidLayoutSubviews() {
        tabBarItem = UITabBarItem(
            title: Constant.notifications,
            image: UIImage(systemName: "message.badge"),
            tag: 1
        )
    }

    private func initSubviews() {
        view.backgroundColor = .white
    }
}
