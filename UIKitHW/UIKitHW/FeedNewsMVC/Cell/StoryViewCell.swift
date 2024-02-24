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

    // MARK: - Private Properties

    private var stories: [Story] = []

    // MARK: - Visual Components

    private lazy var scrollView: UIScrollView = {
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
        contentView.addSubview(scrollView)
    }

    private func setupStoryConstraints(_ storyView: StoryView, index: Int) {
        storyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(80 * index)
            ),
            storyView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            storyView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            storyView.heightAnchor.constraint(equalToConstant: 80),
            storyView.widthAnchor.constraint(equalToConstant: 80)
        ])

        if index == stories.count - 1 {
            NSLayoutConstraint.activate([
                storyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            ])
        }
        if index == 0 {
            NSLayoutConstraint.activate([
                storyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
            ])
        }
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
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
            scrollView.contentSize = storyView.bounds.size
            scrollView.addSubview(storyView)

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
