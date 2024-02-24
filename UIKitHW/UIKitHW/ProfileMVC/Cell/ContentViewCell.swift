// ContentViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let countCol: CGFloat = 3.03
}

/// Отображаем контент пользователя с помощью коллекции
final class ContentViewCell: UITableViewCell {
    // MARK: - Static Properties

    static let reuseID = String(describing: ContentViewCell.self)

    // MARK: - Private Properties

    private var contents: [Content] = []

    // MARK: - Visual Components

    private lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        layout.itemSize = .init(
            width: UIScreen.main.bounds.width / Constants.countCol,
            height: UIScreen.main.bounds.width / Constants.countCol
        )

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            ContentCollectionViewCell.self,
            forCellWithReuseIdentifier: ContentCollectionViewCell.reuseID
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupCollectionViewConstraints()
        contentView.backgroundColor = .red
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubview(collectionView)
    }

    private func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
}

// MARK: - Extension

extension ContentViewCell {
    func configure(contents: [Content]) {
        self.contents = contents
    }
}

// MARK: - Extension ContentViewCell + UICollectionViewDataSource

extension ContentViewCell: UICollectionViewDelegate {}

// MARK: - Extension ContentViewCell + UICollectionViewDataSource

extension ContentViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contents.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContentCollectionViewCell.reuseID,
            for: indexPath
        ) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(contents: contents[indexPath.item])
        return cell
    }
}
