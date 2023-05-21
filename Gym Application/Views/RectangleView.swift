//
//  RectangleView.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-18.
//

import UIKit

class RectangleView: UIView {
    let imageView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            return view
        }()
 
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            createRectangles()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            createRectangles()
        }

        func createRectangles() {
            let rectangleWidth: CGFloat = 200.0
            let rectangleHeight: CGFloat = 190.0
            let rectangleColor = UIColor.red

            let rectangle1 = UIView()
            rectangle1.backgroundColor = rectangleColor
            rectangle1.translatesAutoresizingMaskIntoConstraints = false
            addSubview(rectangle1)

            NSLayoutConstraint.activate([
                rectangle1.widthAnchor.constraint(equalToConstant: rectangleWidth),
                rectangle1.heightAnchor.constraint(equalToConstant: rectangleHeight),
                rectangle1.leadingAnchor.constraint(equalTo: leadingAnchor),
                rectangle1.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

            let rectangle2 = UIView()
            rectangle2.backgroundColor = rectangleColor
            rectangle2.translatesAutoresizingMaskIntoConstraints = false
            addSubview(rectangle2)

            NSLayoutConstraint.activate([
                rectangle2.widthAnchor.constraint(equalToConstant: rectangleWidth),
                rectangle2.heightAnchor.constraint(equalToConstant: rectangleHeight),
                rectangle2.leadingAnchor.constraint(equalTo: rectangle1.trailingAnchor, constant: 10.0),
                rectangle2.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: superview?.centerXAnchor ?? centerXAnchor),
                centerYAnchor.constraint(equalTo: superview?.centerYAnchor ?? centerYAnchor)

            ])
            
        }
    
    }
  
