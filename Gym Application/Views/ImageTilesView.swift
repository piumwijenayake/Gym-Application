//
//  ImageTilesView.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//

import UIKit

class ImageTilesView: UIView {
    private var imageViews: [UIImageView] = []
        var didSelectImage: ((UIImage) -> Void)?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            // Set up the necessary configuration for the view, such as background color, layout constraints, etc.
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            addGestureRecognizer(tapGesture)
        }
        
        func addImageTile(image: UIImage) {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            imageViews.append(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0).isActive = true
            imageView.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            // Perform layout adjustments
            setNeedsLayout()
        }
        
        func removeImageTile(image: UIImage) {
            guard let index = imageViews.firstIndex(where: { $0.image == image }) else { return }
            
            let imageView = imageViews.remove(at: index)
            imageView.removeFromSuperview()
            
            // Perform layout adjustments
            setNeedsLayout()
        }
        
        @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
            let tapLocation = gesture.location(in: self)
            
            for imageView in imageViews {
                if imageView.frame.contains(tapLocation) {
                    didSelectImage?(imageView.image ?? UIImage())
                    break
                }
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // Update the layout constraints of the image tiles
            for imageView in imageViews {
                imageView.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
            }
        }
}
