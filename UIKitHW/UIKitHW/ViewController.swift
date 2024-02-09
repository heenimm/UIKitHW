// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties

    let word = WordModel()

    private let inputLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 275, height: 57))
        label.text = "Вы ввели слово"
        label.font = UIFont(name: "Verdana-Bold", size: 15)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    private let wordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: 275, height: 57))
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .italicSystemFont(ofSize: 15)
        label.isHidden = true
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 60, y: 250, width: 275, height: 57))
        label.text = "А вот что получится, если читать справа налево"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 15)
        label.isHidden = true
        return label
    }()

    private let wordReverseLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 300, width: 275, height: 57))
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .italicSystemFont(ofSize: 15)
        label.isHidden = true
        return label
    }()

    private lazy var beginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 400, width: 335, height: 44))
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Начать", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(alertAction), for: .allEvents)
        return button
    }()

    private lazy var beginButtonDown: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 600, width: 335, height: 44))
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Начать", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(alertAction), for: .allEvents)
        button.isHidden = true
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        view.addSubview(inputLabel)
        view.addSubview(wordLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(wordReverseLabel)
        view.addSubview(beginButton)
        view.addSubview(beginButtonDown)
    }

    @objc private func alertAction() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }

            self.wordReverseLabel.text = self.word.getWord(word: text).capitalized
            self.wordLabel.text = text
            self.inputLabel.isHidden = false
            self.wordLabel.isHidden = false
            self.descriptionLabel.isHidden = false
            self.wordReverseLabel.isHidden = false
            self.beginButton.isHidden = true
            self.beginButtonDown.isHidden = false
        }

        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }

        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
