// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let womanImage = "woman"
    static let manImage = "man"
    static let fontVerdana = "Verdana-bold"
    static let nickNameText = "tur_v_dagestan"
    static let sideInset: CGFloat = 12
    static let interItemInset: CGFloat = 22
    static let postImageSize: CGFloat = 239 / 357
    static let avatarSize: CGFloat = 30
}

///
final class PostViewCell: UITableViewCell {
    // MARK: - Static Constants

    static let reuseID = "PostViewCell"

    // MARK: - Private Properties

    private var numberOfPage = 1
    private var post: Post?

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: Constants.womanImage)
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "tur_v_dagestan"
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 12)
        return label
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "more"), for: .normal)
        return button
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.manImage)
        return imageView
    }()

    private lazy var smallAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: Constants.manImage)
        return imageView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = "Нравиться: 333"
        label.textAlignment = .left
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = makeDescriptionLabelText()
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = false
        return scrollView
    }()

    private let postReactionView = PostReactionView()

    private lazy var commentLabel = makeIconLabel(text: "Комментировать...")
    private lazy var timeLabel = makeIconLabel(text: "30 минут назад")

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupPostReactionViewConstraints()
        setupAvatarImageViewConstraints()
        setupNicknameLabelConstraints()
        setupMoreButtonConstraints()
        setupPostImageViewConstraints()
        setupPageControlConstraints()
        setupLikesLabelConstraints()
        setupSmallAvatarImageViewConstraints()
        setupDescriptionLabelConstraints()
        setupCommentLabelConstraints()
        setupTimeLabelConstraints()
        setupScrollViewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubviews(avatarImageView, postImageView, postReactionView)
        contentView.addSubviews(pageControl, nicknameLabel, moreButton)
        contentView.addSubviews(descriptionLabel, likesLabel, commentLabel, timeLabel)
        contentView.addSubviews(smallAvatarImageView, commentLabel, timeLabel, scrollView)
    }

    private func makeIconLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.textColor = .lightGray
        return label
    }

    private func makeDescriptionLabelText() -> NSMutableAttributedString {
        let nicknameString = "tur_v_dagestan"
        let boldFont = UIFont(name: Constants.fontVerdana, size: 10)
        let boldAttributes = [NSAttributedString.Key.font: boldFont]
        let nicknameBold = NSMutableAttributedString(
            string: nicknameString,
            attributes: boldAttributes as [NSAttributedString.Key: Any]
        )
        let description = " Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        let regularAttribute = [NSAttributedString.Key.font: UIFont(name: Constants.fontVerdana, size: 10)]
        let descriptionRegular = NSAttributedString(
            string: description,
            attributes: regularAttribute as [NSAttributedString.Key: Any]
        )
        nicknameBold.append(descriptionRegular)
        return nicknameBold
    }

    private func setupPostReactionViewConstraints() {
        postReactionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postReactionView.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            postReactionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postReactionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postReactionView.heightAnchor.constraint(equalToConstant: 46),
            postReactionView.widthAnchor.constraint(equalToConstant: contentView.frame.width)
        ])
    }

    private func setupAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupNicknameLabelConstraints() {
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nicknameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            nicknameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }

    private func setupMoreButtonConstraints() {
        moreButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 14),
            moreButton.heightAnchor.constraint(equalToConstant: 2),
            moreButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideInset),
            moreButton.leadingAnchor.constraint(
                equalTo: nicknameLabel.trailingAnchor,
                constant: CGFloat(Constants.sideInset)
            )
        ])
    }

    private func setupPostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            postImageView.heightAnchor.constraint(equalToConstant: 239)
        ])
    }

    private func setupPageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    private func setupLikesLabelConstraints() {
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: postReactionView.bottomAnchor),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            likesLabel.heightAnchor.constraint(equalToConstant: 15),
            likesLabel.widthAnchor.constraint(equalToConstant: 107)
        ])
    }

    private func setupSmallAvatarImageViewConstraints() {
        smallAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smallAvatarImageView.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: 13),
            smallAvatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            smallAvatarImageView.heightAnchor.constraint(equalToConstant: 20),
            smallAvatarImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: 13),
            descriptionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupCommentLabelConstraints() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: smallAvatarImageView.trailingAnchor, constant: 2),
            commentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            commentLabel.heightAnchor.constraint(equalToConstant: 15),
            commentLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    private func setupTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            timeLabel.topAnchor.constraint(equalTo: smallAvatarImageView.bottomAnchor, constant: 5)
        ])
    }

    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 239)
        ])
    }
}

// MARK: - Extension

extension PostViewCell {
    func configureCell(_ post: Post) {
        numberOfPage = post.imageNames.count
        scrollView.contentSize = CGSize(width: postImageView.bounds.size.width * CGFloat(numberOfPage), height: 239)
        scrollView.delegate = self
        post.imageNames.forEach { scrollView.addSubview(UIImageView(image: UIImage(named: $0))) }
        pageControl.numberOfPages = post.imageNames.count
        for imageName in post.imageNames {
            postImageView.image = UIImage(named: imageName)
        }
    }
}

// MARK: - Extension PostViewCell + UIScrollViewDelegate

extension PostViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
