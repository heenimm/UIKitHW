// DetailScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let secondScreenImage = "secondScreenImage"
    static let xmark = "xmark"
}

///Отображаем детально каждый элемент сторис пользователя
final class DetailScreenViewController: UIViewController {
    
    // MARK: - Visual Components

    private var timer = Timer()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: true)
        progressView.progressTintColor = .gray
        progressView.trackTintColor = .lightGray
        progressView.progress = 0.1
        return progressView
    }()

    private let detailPhotoImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.secondScreenImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: Constants.xmark)?.withTintColor(.black, renderingMode: .alwaysOriginal),
            for: .normal
        )
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupDetailPhotoImageViewConstraints()
        setupCloseButtonConstraints()
        setupProgressViewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        createTimer()
        view.backgroundColor = .white
        view.addSubviews(detailPhotoImageView, closeButton, progressView)
    }

    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.5, // каждую секунду
            target: self, // в этом контроллере
            selector: #selector(updateProgressView), // вызывал это метод
            userInfo: nil, // словаря нет
            repeats: true // указываем чтобы эти все шаги повторялись
        )
    }

    private func setupDetailPhotoImageViewConstraints() {
        detailPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailPhotoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            detailPhotoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailPhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupCloseButtonConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14)
        ])
    }

    private func setupProgressViewConstraints() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc private func updateProgressView() {
        if progressView.progress != 1.0 {
            UIView.animate(withDuration: 1) { [weak self] in
                self?.progressView.progress += 0.05 / 1.0
            }
        } else if progressView.progress == 1.0 {
            timer.invalidate()
            dismiss(animated: true)
        }
    }

    @objc private func tappedCloseButton() {
        timer.invalidate()
        dismiss(animated: true)
    }
}
