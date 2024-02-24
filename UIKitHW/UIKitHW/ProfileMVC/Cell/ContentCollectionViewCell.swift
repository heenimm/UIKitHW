// ContentCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Устанавливаем картинку для отображения в каждой  ячейке коллекции.
final class ContentCollectionViewCell: UICollectionViewCell {
    // MARK: - Static Properties

    static let reuseID = String(describing: ContentCollectionViewCell.self)

    // MARK: - Visual Components

    private let contentImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        clipsToBounds = true
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Public Methods

    private func setupSubviews() {
        contentView.addSubview(contentImageView)
    }

    func configureCell(contents: Content) {
        contentImageView.image = UIImage(named: contents.pictureContent)
    }

    private func setupConstraints() {
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
