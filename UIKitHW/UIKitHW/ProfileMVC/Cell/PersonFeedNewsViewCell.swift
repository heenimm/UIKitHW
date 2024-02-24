// PersonFeedNewsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Позволяет открыть окно с изображением
protocol PersonFeedNewsViewCellDelegate: AnyObject {
    func openDetailScreen()
}

/// Устанавливаем горизонтальное отображение сторисов пользователя
final class PersonFeedNewsViewCell: UITableViewCell {
    // MARK: - Static Properties

    static let reuseID = String(describing: PersonFeedNewsViewCell.self)

    // MARK: - Private Properties

    private var personStories: [PersonStory] = []
    weak var delegate: PersonFeedNewsViewCellDelegate?

    // MARK: - Visual Components

    private let personStoryView = PersonStoryView()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupScrollviewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(personStoryView)
    }

    private func setupScrollviewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    private func setupPersonStoryViewConstraints(_ personStoryView: PersonStoryView, index: Int) {
        personStoryView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            personStoryView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            personStoryView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            personStoryView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(80 * index)
            ),
            personStoryView.heightAnchor.constraint(equalToConstant: 60),
            personStoryView.widthAnchor.constraint(equalToConstant: 60)
        ])

        if index == 0 {
            NSLayoutConstraint.activate([
                personStoryView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12)
            ])
        }

        if index == personStories.count - 1 {
            NSLayoutConstraint.activate([
                personStoryView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            ])
        }
    }
}

// MARK: - Extension

extension PersonFeedNewsViewCell {
    func configureCell(_ personStories: [PersonStory]) {
        self.personStories = personStories

        for (index, personStory) in personStories.enumerated() {
            let personStoryView = PersonStoryView()
            scrollView.addSubview(personStoryView)
            scrollView.contentSize = personStoryView.bounds.size
            setupPersonStoryViewConstraints(personStoryView, index: index)
            personStoryView.postImageView.layer.borderWidth = 2
            personStoryView.postImageView.layer.borderColor = .init(red: 239, green: 239, blue: 239, alpha: 1)
            personStoryView.postImageView.image = UIImage(named: personStory.storyImage)
            personStoryView.postTitleLabel.text = personStory.storyTitle
            personStoryView.addGestureRecognizer(tapContentView())
        }
    }

    private func tapContentView() -> UIGestureRecognizer {
        UITapGestureRecognizer(target: self, action: #selector(openDetailScreen))
    }

    @objc private func openDetailScreen() {
        delegate?.openDetailScreen()
    }
}
