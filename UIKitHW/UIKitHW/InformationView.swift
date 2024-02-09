// InformationView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

class InformationView: UIView {
    // MARK: - Private Properties

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 275, height: 57)
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        label.text = "Вы ввели слово"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var wordLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 275, height: 57)
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
