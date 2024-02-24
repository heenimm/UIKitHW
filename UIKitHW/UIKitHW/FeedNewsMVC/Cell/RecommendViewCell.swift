// RecommendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let recommendYou = "Рекомендуем вам"
    static let all = "Все"
    static let fontVerdana = "Verdana-Bold"
    static let plusBackgroundColor = "plusBackground"
}

///
final class RecommendViewCell: UITableViewCell {
    // MARK: - Static Constants

    static let reuseID = "RecommendViewCell"
    private var recommends: [Recommended] = []
    private var recommendViews: [RecommendView] = []

    // MARK: - Visual Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recommendYou
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    private let allLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.all
        label.textColor = UIColor(named: "AppBlue")
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.contentInset.left = 17
        scrollView.contentInset.right = 17
        return scrollView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupScrollViewConstrains()
        setupTitleLabelConstrains()
        setupAllLabelConstrains()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        backgroundColor = UIColor(named: "AppGrey")
        contentView.addSubviews(scrollView, titleLabel, allLabel)
    }

    private func setupScrollViewConstrains() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }

    private func setupRecommendViewConstrains(_ recommendView: RecommendView, index: Int) {
        recommendView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recommendView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: 200 * CGFloat(index)
            ),
            recommendView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            recommendView.widthAnchor.constraint(equalToConstant: 185),
            recommendView.heightAnchor.constraint(equalToConstant: 200)
        ])
        if index == recommends.count - 1 {
            NSLayoutConstraint.activate([
                recommendView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            ])
        }
    }

    private func setupTitleLabelConstrains() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            titleLabel.widthAnchor.constraint(equalToConstant: 107),
            titleLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    private func setupAllLabelConstrains() {
        allLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            allLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            allLabel.widthAnchor.constraint(equalToConstant: 30),
            allLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}

// MARK: - extension

extension RecommendViewCell {
    func configureRecommendedCell(_ recommends: [Recommended]) {
        self.recommends = []
        recommends.forEach { self.recommends.append($0) }
        for (index, recommend) in recommends.enumerated() {
            let recommendView = RecommendView()
            scrollView.contentSize = recommendView.bounds.size
            scrollView.addSubview(recommendView)
            recommendView.userImageView.image = UIImage(named: recommend.imageName)
            recommendView.nameLabel.text = recommend.userName
            recommendViews.append(recommendView)
            setupRecommendViewConstrains(recommendView, index: index)
        }
    }
}
