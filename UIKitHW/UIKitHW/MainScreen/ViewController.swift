// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ViewController: UIViewController {
    // MARK: - Types

    let randomNumber = Int.random(in: 1 ... 10)
    let currentNumber = 0

    // MARK: - Private Properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: view.frame.width, height: 102)
        ))
        label.backgroundColor = UIColor(151, 203, 229)
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: view.frame.width, height: view.frame.height)
        ))
        imageView.image = UIImage(named: "Background")
        return imageView
    }()

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(
            origin: CGPoint(x: 85, y: 264),
            size: CGSize(width: 150, height: 150)
        ))
        button.layer.cornerRadius = view.frame.width / 9
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(76, 36, 115).cgColor
        button.backgroundColor = UIColor(155, 127, 181)
        button.clipsToBounds = true
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.addTarget(self, action: #selector(makeGuessNumberAlert), for: .touchUpInside)
        return button
    }()

    private lazy var calculateButton: UIButton = {
        let button = UIButton(frame: CGRect(
            origin: CGPoint(x: 132, y: 470),
            size: CGSize(width: 200, height: 200)
        ))
        button.layer.cornerRadius = view.frame.width / 9
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(59, 105, 76).cgColor
        button.backgroundColor = UIColor(100, 181, 130)
        button.clipsToBounds = true
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.addTarget(self, action: #selector(makeCalculateAlert), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeGreetAlert()
    }

    // MARK: - Private Methods

    private func addSubview() {
        view.addSubview(backgroundImageView)
        view.addSubview(guessNumberButton)
        view.addSubview(calculateButton)
        view.addSubview(titleLabel)
    }

    private func makeGreetAlert() {
        let alertController = UIAlertController(
            title: "Пожалуйста представьтесь",
            message: "",
            preferredStyle: .alert
        )
        let actionDone = UIAlertAction(title: "Готово", style: .cancel) { _ in
            if let text = alertController.textFields?.first?.text, text.count > 2 {
                DispatchQueue.main.async {
                    self.titleLabel.isHidden = false
                    self.titleLabel.text = "\n " + "Приветствую \n " + text.uppercased() + "!"
                }
            }
        }
        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        alertController.addAction(actionDone)
        present(alertController, animated: true)
    }

    @objc private func makeCalculateAlert() {
        let alertController = UIAlertController(
            title: "Введите ваши числа",
            message: "",
            preferredStyle: .alert
        )
        let chooseOperation = UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            if let first = Int(alertController.textFields?.first?.text ?? ""),
               let second = Int(alertController.textFields?.last?.text ?? "")
            {
                self.chooseOperationAlert(first, second)
            }
        }
        let actionDone = UIAlertAction(title: "Готово", style: .cancel) { _ in }
        alertController.addTextField { textField in
            textField.placeholder = "Число 1"
            textField.keyboardType = .numberPad
        }
        alertController.addTextField { textField in
            textField.placeholder = "Число 2"
            textField.keyboardType = .numberPad
        }
        alertController.addAction(actionDone)
        alertController.addAction(chooseOperation)
        present(alertController, animated: true)
    }

    @objc private func makeGuessNumberAlert() {
        let alertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: "",
            preferredStyle: .alert
        )
        let actionDone = UIAlertAction(title: "OK", style: .default) { _ in
            if let number = Int(alertController.textFields?.first?.text ?? " ") {
//                if number < self.randomNumber {
//                    self.makeAlert("Попробуй еще раз", "Вы ввели слишком маленькое число", .alert)
//                }
//                if number > self.randomNumber {
//                    self.makeAlert("Попробуй еще раз", "Вы ввели слишком большое число", .alert)
//                }
                if number == self.randomNumber {
                    self.makeAlert("Поздравляем", "Вы угадали", .alert)
                } else {
                    self.makeAlert("Упс", "Это неверный ответ", .alert)
                }
            }
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in }
        alertController.addTextField { textField in
            textField.placeholder = "Введите число"
            textField.keyboardType = .numberPad
        }
        alertController.addAction(actionDone)
        alertController.addAction(actionCancel)
        present(alertController, animated: true)
    }

    private func makeAlert(
        _ title: String,
        _ message: String,
        _ style: UIAlertController.Style
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let actionDone = UIAlertAction(title: "OK", style: .default) { _ in }
        alertController.addAction(actionDone)
        present(alertController, animated: true)
    }

    private func chooseOperationAlert(_ first: Int, _ second: Int) {
        let alertController = UIAlertController(
            title: "Выберите математическую операцию",
            message: "",
            preferredStyle: .alert
        )
        let addition = UIAlertAction(title: "Сложить", style: .default) { _ in
            self.presentResultAlert(first + second)
        }
        let subtraction = UIAlertAction(title: "Вычесть", style: .default) { _ in
            self.presentResultAlert(first - second)
        }
        let multiple = UIAlertAction(title: "Умножить", style: .default) { _ in
            self.presentResultAlert(first * second)
        }
        let division = UIAlertAction(title: "Разделить", style: .default) { _ in
            if second != 0 {
                self.presentResultAlert(first / second)
            } else {}
        }
        let actionDone = UIAlertAction(title: "Готово", style: .cancel) { _ in }
        alertController.addAction(addition)
        alertController.addAction(subtraction)
        alertController.addAction(multiple)
        alertController.addAction(division)
        alertController.addAction(actionDone)
        present(alertController, animated: true)
    }

    private func presentResultAlert(_ result: Int) {
        let alertController = UIAlertController(
            title: "Ваш результат",
            message: String(result),
            preferredStyle: .alert
        )
        let actionDone = UIAlertAction(title: "OK", style: .default) { _ in }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in }
        alertController.addAction(actionDone)
        alertController.addAction(actionCancel)
        present(alertController, animated: true)
    }
}
