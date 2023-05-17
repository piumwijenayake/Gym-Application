//
//  CustomTextField.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-13.
//

import UIKit

class CustomTextField: UITextField {
    
    
    init() {
          super.init(frame: .zero)
          configureTextField()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          configureTextField()
      }
      
      private func configureTextField() {
          textColor = .label
          tintColor = .systemBlue
          textAlignment = .center
          font = .systemFont(ofSize: 17, weight: .semibold)
          
          layer.cornerRadius = 11
          backgroundColor = .white
          keyboardType = .decimalPad
          isUserInteractionEnabled = false
                 
          leftView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
          leftViewMode = .always
          
          attributedPlaceholder = NSAttributedString(string: "TEXT", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
          autocapitalizationType = .sentences
          autocorrectionType = .default
      }
  }
