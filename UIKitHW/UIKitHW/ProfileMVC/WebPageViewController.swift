// WebPageViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

///по ссылке открывается окно браузера в нашем модальном представлении
final class WebPageViewController: UIViewController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupWebViewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        loadRequest()
        view.addSubview(webView)
    }

    private let webView = WKWebView()

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func setupWebViewConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}
