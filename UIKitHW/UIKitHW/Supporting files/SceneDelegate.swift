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
        let navigationController = UINavigationController(rootViewController: SignUpViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
