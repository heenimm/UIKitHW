// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let profile = "Профиль"
    static let fontVerdana = "Verdana-Bold"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
    static let myData = "Мои данные"
    static let bringFriend = "Приведи друга"
    static let feedBack = "Обратная связь"
}

/// В данном классе создается окно профиля пользователя
final class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
    }

    override func viewDidLayoutSubviews() {
        tabBarItem = UITabBarItem(
            title: Constant.profile,
            image: UIImage(systemName: "person"),
            tag: 2
        )
    }

    private func initSubviews() {
        view.backgroundColor = .white
    }
}
