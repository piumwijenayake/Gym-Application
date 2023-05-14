//
//  Header.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//

import UIKit

class Header: UIView {

 
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 26, weight: .bold)
            label.text = "Error"
            return label
        }()
        
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 18, weight: .regular)
            label.text = "Error"
            return label
        }()
    init(title:String,subTitle:String){
        super.init(frame: .zero)
                self.titleLabel.text = title
                self.subTitleLabel.text = subTitle
                self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
          
          self.addSubview(titleLabel)
          self.addSubview(subTitleLabel)

          
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          subTitleLabel.translatesAutoresizingMaskIntoConstraints = false


          NSLayoutConstraint.activate([
              
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
])
      }


}

