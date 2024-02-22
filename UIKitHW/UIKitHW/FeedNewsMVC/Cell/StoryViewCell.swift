// StoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let sideInset: CGFloat = 12
    static let interItemInset: CGFloat = 22
    static let yourHistory = "Ваша история"
    static let womanImage = "woman"
    static let plusBackgroundColor = "plusBackground"
}

/// прорисовываем ленту сторисов
final class StoryViewCell: UITableViewCell {
    // MARK: - Static Constants

    static let reuseID = String(describing: StoryViewCell.self)
    private var stories: [Story] = []

    // MARK: - Private Properties

    private lazy var storyScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        return scrollView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubview(storyScrollView)
    }

    private func setupStoryConstraints(_ storyView: StoryView, index: Int) {
        storyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyView.leadingAnchor.constraint(
                equalTo: storyScrollView.leadingAnchor,
                constant: CGFloat(80 * index)
            ),
            storyView.topAnchor.constraint(equalTo: storyScrollView.topAnchor),
            storyView.bottomAnchor.constraint(equalTo: storyScrollView.bottomAnchor),
            storyView.heightAnchor.constraint(equalToConstant: 80),
            storyView.widthAnchor.constraint(equalToConstant: 80)
        ])

        if index == stories.count - 1 {
            NSLayoutConstraint.activate([
                storyView.trailingAnchor.constraint(equalTo: storyScrollView.trailingAnchor)
            ])
        }
        if index == 0 {
            NSLayoutConstraint.activate([
                storyView.leadingAnchor.constraint(equalTo: storyScrollView.leadingAnchor)
            ])
        }
    }

    private func setupConstraints() {
        storyScrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            storyScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            storyScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

// MARK: - Extension

extension StoryViewCell {
    func configureCell(_ story: [Story]) {
        stories = []
        stories.insert(Story(userName: "Ваша история", userIcon: "firstStory", isViewed: true), at: 0)
        story.forEach { stories.append($0) }
        for (index, story) in stories.enumerated() {
            let storyView = StoryView()
            if index == 0 {
                storyView.plusButton.isHidden = false
            }
            storyScrollView.contentSize = storyView.bounds.size
            storyScrollView.addSubview(storyView)

            setupStoryConstraints(storyView, index: index)
            if !story.isViewed {
                storyView.userImageView.layer.borderWidth = 2
                storyView.userImageView.layer.borderColor = .init(red: 0, green: 100, blue: 150, alpha: 1)
            }
            storyView.nameLabel.text = story.userName
            storyView.userImageView.image = UIImage(named: story.userIcon)
        }
    }
}

extension StoryViewCell: UIScrollViewDelegate {}
