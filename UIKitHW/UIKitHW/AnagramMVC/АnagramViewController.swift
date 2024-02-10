// АnagramViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// АnagramViewController - данный класс переворачивает слово введенное в алерт и выводит его наоборот
final class АnagramViewController: UIViewController {
    // MARK: - Private Properties

    private let word = WordModel()

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
    }

    @objc private func alertAction() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.initViews(word: text)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

    private func initViews(word: String) {
        wordReverseLabel.text = self.word.getWord(word: word).capitalized
        wordLabel.text = word
        inputLabel.isHidden = false
        wordLabel.isHidden = false
        descriptionLabel.isHidden = false
        wordReverseLabel.isHidden = false
        beginButton.frame.origin.y = 600
    }
}

extension АnagramViewController {
    func makeAlert(title: String, message: String, textFields: [UITextField]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for _ in textFields {
            alert.addTextField { textFields in
            }
        }
        let okAction = UIAlertAction(title: "Ок", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
