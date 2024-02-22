// FeedNewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let tape = "Лента"
    static let fontVerdana = "Verdana-Bold"
    static let voiceMessageIcon = "voiceMessageIcon"
    static let topInset = 33
    static let generalInset = 20
    static let appIcon = "appIcon"
}

/// Данный класс отвечает за отображение новостной ленты
final class FeedNewsViewController: UIViewController {
    private let contentTypes: [ContentType] = [.stories, .firstPost, .recommendations, .posts]
    private let storageStory = StorageStory()
    private let storagePost = StoragePost()
    private let storageRecommended = StorageRecommended()

    // MARK: - Private Properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StoryViewCell.self, forCellReuseIdentifier: StoryViewCell.reuseID)
        tableView.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.reuseID)
        tableView.register(RecommendViewCell.self, forCellReuseIdentifier: RecommendViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        return tableView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        setupSubviews()
        setupConstraints()
        configureNavigationItem()
    }

    // MARK: - Private Methods

    private func initSubviews() {
        view.backgroundColor = .white
    }

    private func setupSubviews() {
        view.addSubview(tableView)
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

    private func configureNavigationItem() {
        let iconApp = UIBarButtonItem(customView: UIImageView(image: UIImage(named: Constants.appIcon)))
        navigationItem.leftBarButtonItem = iconApp
        let rightItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: Constants.voiceMessageIcon)))
        navigationItem.rightBarButtonItem = rightItem
    }
}

// MARK: - Extension

extension FeedNewsViewController {
    private enum ContentType {
        case stories
        case firstPost
        case recommendations
        case posts
    }
}

// MARK: - Extension FeedNewsViewController + UITableViewDelegate

extension FeedNewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentTypes[indexPath.section] {
        case .stories:
            return 80
        case .firstPost, .posts:
            return 440
        case .recommendations:
            return 255
        }
    }
}

// MARK: - Extension FeedNewsViewController + UITableViewDataSource

extension FeedNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentTypes[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryViewCell.reuseID, for: indexPath) as?
                StoryViewCell
            else { return UITableViewCell() }
            cell.configureCell(storageStory.getStoriesData())
            return cell
        case .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostViewCell.reuseID, for: indexPath) as? PostViewCell
            else { return UITableViewCell() }
            return cell
        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostViewCell.reuseID, for: indexPath) as? PostViewCell
            else { return UITableViewCell() }
            cell.configureCell(storagePost.getPosts(index: indexPath.row))
            return cell
        case .recommendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendViewCell.reuseID,
                for: indexPath
            ) as? RecommendViewCell else { return UITableViewCell() }
            cell.configureRecommendedCell(storageRecommended.recommends)
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        contentTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentTypes[section] {
        case .firstPost, .stories, .recommendations:
            return 1
        case .posts:
            return storagePost.posts.count - 1
        }
    }
}
