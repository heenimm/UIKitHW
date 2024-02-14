// UIButton+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

///Расширение для настройки имеджвью
extension UIButton {
    ///Изменила инициализацию для добавления дополнительных параметров
    convenience init(
        valueX: Int,
        valueY: Int,
        width: Int,
        height: Int,
        background: String,
        imageName: String,
        title: String
    ) {
        self.init(frame: CGRect(
            x: valueX,
            y: valueY,
            width: width,
            height: height
        ))
        backgroundColor = UIColor(named: background)
        setImage(UIImage(named: imageName), for: .normal)
        titleEdgeInsets = UIEdgeInsets(top: -10, left: -75, bottom: -100, right: 20)
        imageEdgeInsets = UIEdgeInsets(top: -80, left: 10, bottom: -50, right: -50)
        titleLabel?.textAlignment = .center
        setTitleColor(.black, for: .normal)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "Verdana", size: 15)
        titleLabel?.numberOfLines = 0
    }
}
