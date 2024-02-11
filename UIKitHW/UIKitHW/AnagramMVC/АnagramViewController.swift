// АnagramViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// АnagramViewController - данный класс переворачивает слово введенное в алерт и выводит его наоборот
final class АnagramViewController: UIViewController {
    // MARK: - Private Properties

    private let word = WordModel()
    private let informationView = InformationView()

    private lazy var beginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 400, width: 335, height: 44))
        button.backgroundColor = UIColor(named: "AppGreen")
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
        view.addSubviews(beginButton, informationView)
        informationView.isHidden = true
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

    // MARK: - Life Cycle

    private func initViews(word: String) {
        informationView.wordReverseLabel.text = self.word.getWord(word: word).capitalized
        informationView.wordLabel.text = word
        informationView.inputLabel.isHidden = false
        informationView.wordLabel.isHidden = false
        informationView.descriptionLabel.isHidden = false
        informationView.wordReverseLabel.isHidden = false
        informationView.isHidden = false
        beginButton.frame.origin.y = 600
    }
}

// MARK: - Extension

extension АnagramViewController {
    func makeAlert(title: String, message: String, textFields: [UITextField]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for _ in textFields {
            alert.addTextField { _ in
            }
        }
        let okAction = UIAlertAction(title: "Ок", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
