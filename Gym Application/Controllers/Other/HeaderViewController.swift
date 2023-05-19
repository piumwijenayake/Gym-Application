//
//  HeaderViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-19.
//

import UIKit

class HeaderViewController: UIViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
            
            // Header creation code
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 13
        stackView.distribution = .fillProportionally // Adjust the distribution property
              
            
            let imageView1 = UIImageView(image: UIImage(named: "menu"))
            imageView1.contentMode = .scaleAspectFit
            imageView1.heightAnchor.constraint(equalToConstant: 30).isActive = true // Adjust the height as needed
                
           
            
            let imageView2 = UIImageView(image: UIImage(named: "profile"))
            imageView2.contentMode = .scaleAspectFit
            imageView2.heightAnchor.constraint(equalToConstant: 70).isActive = true // Adjust the height as needed
        imageView2.widthAnchor.constraint(equalToConstant: 70).isActive = true
            
          
        let label = UILabel()
        label.text = "Exercise List"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal) // Update the compression resistance priority

        // Adjust the width constraint of the label
        let labelWidthConstraint = label.widthAnchor.constraint(equalToConstant: 70)
        labelWidthConstraint.priority = .defaultHigh
        labelWidthConstraint.isActive = true

   
        
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView()) // Ad
        stackView.addArrangedSubview(UIView())// Add an empty view as a spacer
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(UIView()) // Ad
        stackView.addArrangedSubview(UIView())
        
        
        stackView.addArrangedSubview(imageView2)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
            
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
             
            ])
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
