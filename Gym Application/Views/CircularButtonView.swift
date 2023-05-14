//
//  CircularButtonView.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//
import UIKit

class CircularButtonView: UIView {
    
     let button: UIButton = {
        let button = UIButton()
         button.setTitle("Click Me", for: .normal)
         button.backgroundColor = .systemBlue
         button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
         button.layer.cornerRadius = button.frame.width / 2
         button.clipsToBounds = true
         return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        button.frame = bounds
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(button)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        button.addTarget(target, action: action, for: controlEvents)
    }
    
    // Add any other customizations or methods as needed
}
