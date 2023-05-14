//
//  CustomCollectionViewCell.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//

import UIKit
class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
  
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    public func configure(with image: UIImage, title: String) {
        self.myImageView.image = image
        self.titleLabel.text = title
        self.setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(myImageView)
        self.addSubview(titleLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 340), // Adjust the height as desired
                       
            titleLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: -35), // Adjus 
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        self.titleLabel.text = nil
    }
}

