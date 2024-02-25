// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

private enum Constants {
    static let fontVerdanaBold = "Verdana-Bold"
    static let fontVerdana = "Verdana"
}

/// В данном классе создается окно профиля пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Private Properties

    private let contentType: [ContentType] = [.header, .personFeedNews, .content]
    private let storagePersonStory = StoragePersonStory()
    private let storageContent = StorageContent()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        setupConstraints()
        configureNavigationItem()
    }

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(HeaderViewCell.self, forCellReuseIdentifier: HeaderViewCell.reuseID)
        tableView.register(PersonFeedNewsViewCell.self, forCellReuseIdentifier: PersonFeedNewsViewCell.reuseID)
        tableView.register(ContentViewCell.self, forCellReuseIdentifier: ContentViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        return tableView
    }()

    private func initSubviews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }

    private func configureNavigationItem() {
        let lockBarItem = UIBarButtonItem(image: UIImage(named: "lock")?.withRenderingMode(.alwaysOriginal))
        let nicknameLabel = UILabel()
        nicknameLabel.text = "mary_rmLink"
        nicknameLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        let nicknameBarButtonItem = UIBarButtonItem(customView: nicknameLabel)
        navigationItem.setLeftBarButtonItems([lockBarItem, nicknameBarButtonItem], animated: true)
        let plusItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "plus")))
        let spaceItem = UIBarButtonItem(systemItem: .fixedSpace)
        spaceItem.width = 5
        let multipleLineItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "multipleLine")))
        navigationItem.setRightBarButtonItems([multipleLineItem, spaceItem, plusItem], animated: true)
        navigationController?.navigationBar.backgroundColor = .white
    }

    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Extension

extension ProfileViewController {
    private enum ContentType {
        case header
        case personFeedNews
        case content
    }
}

// MARK: - Extension ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentType[indexPath.section] {
        case .header:
            return 250
        case .personFeedNews:
            return 80
        case .content:
            return 255
        }
    }
}

// MARK: - Extension ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .header:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: HeaderViewCell.reuseID, for: indexPath) as? HeaderViewCell
            else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .personFeedNews:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PersonFeedNewsViewCell.reuseID,
                for: indexPath
            ) as? PersonFeedNewsViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureCell(storagePersonStory.getPersonStories())
            return cell
        case .content:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: ContentViewCell.reuseID, for: indexPath) as? ContentViewCell
            else { return UITableViewCell() }
            cell.configure(contents: storageContent.contents)
            return cell
        }
    }
}

// MARK: - Extension ProfileViewController + HeaderViewCellDelegate

extension ProfileViewController: HeaderViewCellDelegate {
    func openWebPageScreen() {
        present(WebPageViewController(), animated: true)
    }
}

// MARK: - Extension ProfileViewController + PersonFeedNewsViewCellDelegate

extension ProfileViewController: PersonFeedNewsViewCellDelegate {
    func openDetailScreen() {
        present(DetailScreenViewController(), animated: true)
    }
}
