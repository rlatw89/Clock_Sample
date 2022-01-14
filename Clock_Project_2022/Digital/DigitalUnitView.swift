//
//  DigitalUnitView.swift
//  Clock_Project_2022
//
//  Created by Taewan_MacBook on 2022/01/14.
//

import UIKit

/// Combined two digital number view
class DigitalUnit: UIView {
    private lazy var leftDigit: DigitalComponent = {
        let digit = DigitalComponent()
        digit.translatesAutoresizingMaskIntoConstraints = false
        addSubview(digit)
        return digit
    } ()
    
    private lazy var rightDigit: DigitalComponent = {
        let digit = DigitalComponent()
        digit.translatesAutoresizingMaskIntoConstraints = false
        addSubview(digit)
        return digit
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// draw left digit and right digit by input value
    /// - Parameter value: time component. hour, minute or second.
    func setSegmentNumbers(value: Int) {
        // set left digit and right digit
        let left = value / 10
        let right = value - left * 10
        leftDigit.setSegmentNumber(value: left)
        rightDigit.setSegmentNumber(value: right)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            leftDigit.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftDigit.topAnchor.constraint(equalTo: topAnchor),
            leftDigit.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftDigit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            rightDigit.leadingAnchor.constraint(equalTo: leftDigit.trailingAnchor),
            rightDigit.topAnchor.constraint(equalTo: topAnchor),
            rightDigit.bottomAnchor.constraint(equalTo: leftDigit.bottomAnchor),
            rightDigit.widthAnchor.constraint(equalTo: leftDigit.widthAnchor)
        ])
    }
}

