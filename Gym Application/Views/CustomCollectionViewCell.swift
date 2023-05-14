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
    
    override var isSelected: Bool {
        didSet {
            updateSelection()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(myImageView)
        addSubview(titleLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 340),
                       
            titleLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: -35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with image: UIImage, title: String) {
        myImageView.image = image
        titleLabel.text = title
    }
    
    private func updateSelection() {
        contentView.layer.borderWidth = isSelected ? 8.0 : 0.0
        contentView.layer.borderColor = UIColor.blue.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        titleLabel.text = nil
    }
}
