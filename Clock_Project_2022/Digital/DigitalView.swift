//
//  DigitalView.swift
//  Clock_Project_2022
//
//  Created by Taewan_MacBook on 2022/01/14.
//

import UIKit

/// Digital Clock View
///
/// Form: HH : mm : ss
class DigitalView: UIView {
    /// hour view property
    private lazy var hourView: DigitalUnit = {
        let view = DigitalUnit()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    } ()
    
    /// Left seperating dot view property
    private lazy var leftSeperator: DigitalUnit = {
        let view = DigitalUnit()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    } ()
    /// minute view property
    private lazy var minuteView: DigitalUnit = {
        let view = DigitalUnit()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    } ()
    
    /// Left seperating dot view property
    private lazy var rightSeperator: DigitalUnit = {
        let view = DigitalUnit()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    } ()
    /// second view property
    private lazy var secondView: DigitalUnit = {
        let view = DigitalUnit()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// Set the time to draw digital number segments
    ///
    /// value parameters hour, minute, and second only allow 2 digit numbers 0 - 99
    /// - Parameters:
    ///   - hour: hour
    ///   - minute: minute
    ///   - second: second
    func setCurrentTime(hour: Int, minute: Int, second: Int) {
        hourView.setSegmentNumbers(value: hour)
        minuteView.setSegmentNumbers(value: minute)
        secondView.setSegmentNumbers(value: second)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            hourView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hourView.topAnchor.constraint(equalTo: topAnchor),
            hourView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hourView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            hourView.heightAnchor.constraint(equalTo: hourView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            leftSeperator.leadingAnchor.constraint(equalTo: hourView.trailingAnchor),
            leftSeperator.topAnchor.constraint(equalTo: topAnchor),
            leftSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftSeperator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.125)
        ])
        
        NSLayoutConstraint.activate([
            minuteView.leadingAnchor.constraint(equalTo: leftSeperator.trailingAnchor),
            minuteView.topAnchor.constraint(equalTo: topAnchor),
            minuteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            minuteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            rightSeperator.leadingAnchor.constraint(equalTo: minuteView.trailingAnchor),
            rightSeperator.topAnchor.constraint(equalTo: topAnchor),
            rightSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightSeperator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.125)
        ])
        
        NSLayoutConstraint.activate([
            secondView.leadingAnchor.constraint(equalTo: rightSeperator.trailingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.topAnchor.constraint(equalTo: topAnchor),
            secondView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

