// InformationView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Данное вью отображается при нажатии на кнопку которая переворачивает слово на главном экране
class InformationView: UIView {
    
    // MARK: - Private Properties

    let inputLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 275, height: 57))
        label.text = "Вы ввели слово"
        label.font = UIFont(name: "Verdana-Bold", size: 15)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    let wordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: 275, height: 57))
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .italicSystemFont(ofSize: 15)
        label.isHidden = true
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 60, y: 250, width: 275, height: 57))
        label.text = "А вот что получится, если читать справа налево"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 15)
        label.isHidden = true
        return label
    }()

    let wordReverseLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 300, width: 275, height: 57))
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .italicSystemFont(ofSize: 15)
        label.isHidden = true
        return label
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubviews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        addSubview(inputLabel)
        addSubview(wordLabel)
        addSubview(descriptionLabel)
        addSubview(wordReverseLabel)
    }
}
