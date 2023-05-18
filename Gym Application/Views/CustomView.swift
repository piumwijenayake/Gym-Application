//
//  CustomView.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-18.
//

import UIKit

class CustomView: UIView {
    
    private let stackView = UIStackView()
       var imageView1: UIImageView?
       var imageView2: UIImageView?
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupUI()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupUI()
       }
       
       private func setupUI() {
           // Customize the stack view as needed
           stackView.axis = .horizontal
           stackView.distribution = .fillEqually
           stackView.spacing = 20
           stackView.translatesAutoresizingMaskIntoConstraints = false
           imageView1?.translatesAutoresizingMaskIntoConstraints = false
           // Add the stack view as a subview
           addSubview(stackView)
           
           // Add constraints for the stack view
           NSLayoutConstraint.activate([
               stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
               stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
               stackView.topAnchor.constraint(equalTo: topAnchor),
               stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
               
                   
           ])
           // Set fixed height and width for the images
               imageView1?.translatesAutoresizingMaskIntoConstraints = false
               imageView1?.widthAnchor.constraint(equalToConstant: 100).isActive = true
               imageView1?.heightAnchor.constraint(equalToConstant: 200).isActive = true
                   
               imageView2?.translatesAutoresizingMaskIntoConstraints = false
               imageView2?.widthAnchor.constraint(equalToConstant: 100).isActive = true
               imageView2?.heightAnchor.constraint(equalToConstant: 200).isActive = true
       }
    
       
       // Method to add arranged subviews to the stack view
       func addArrangedSubview(_ view: UIView) {
           stackView.addArrangedSubview(view)
           
           // Check if the added subview is an image view
           if let imageView = view as? UIImageView {
               if imageView1 == nil {
                   imageView1 = imageView
               } else if imageView2 == nil {
                   imageView2 = imageView
               }
               
               // Apply initial border styles
               applyInitialBorderStyles()
           }
       }
       
       private func applyInitialBorderStyles() {
           imageView1?.layer.borderWidth = 1
           imageView1?.layer.borderColor = UIColor.black.cgColor
           
           imageView2?.layer.borderWidth = 1
           imageView2?.layer.borderColor = UIColor.black.cgColor
       }
       
       func updateBorders(with firstImageViewBorderColor: UIColor, secondImageViewBorderColor: UIColor) {
           imageView1?.layer.borderColor = firstImageViewBorderColor.cgColor
           imageView2?.layer.borderColor = secondImageViewBorderColor.cgColor
       }
    func setStackViewDistribution(_ distribution: UIStackView.Distribution) {
        stackView.distribution = distribution
    }
   }
