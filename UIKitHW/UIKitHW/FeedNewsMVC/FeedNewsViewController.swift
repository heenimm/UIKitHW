// FeedNewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let tape = "Лента"
    static let fontVerdana = "Verdana-Bold"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
    static let myData = "Мои данные"
    static let bringFriend = "Приведи друга"
    static let feedBack = "Обратная связь"
}

/// Данный класс отвечает за отображение новостной ленты
final class FeedNewsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
    }

    override func viewDidLayoutSubviews() {
        tabBarItem = UITabBarItem(
            title: Constant.tape,
            image: UIImage(systemName: "house"),
            tag: 0
        )
    }

    private func initSubviews() {
        view.backgroundColor = .white
    }
}
