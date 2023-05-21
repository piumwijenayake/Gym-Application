//
//  FItness PlanViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-21.
//

import UIKit

class FItness_PlanViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Fitness Packages"
        
        // First Card
        let firstCardView = createCardView(color: .systemBlue, text: "Meal Timetable", imageName: "healthy")
        firstCardView.isUserInteractionEnabled = true
        firstCardView.tag = 0
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(_:)))
        let secondTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(_:)))
        firstCardView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(firstCardView)
        
        NSLayoutConstraint.activate([
            firstCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstCardView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Second Card
        let secondCardView = createCardView(color: .systemGreen, text: "Fitness Package", imageName: "exercise")
        secondCardView.isUserInteractionEnabled = true
        secondCardView.tag = 1
    //    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(_:)))

        secondCardView.addGestureRecognizer(secondTapGestureRecognizer)
        view.addSubview(secondCardView)

        view.addSubview(secondCardView)
        NSLayoutConstraint.activate([
            secondCardView.topAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: 120),
            secondCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondCardView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func createCardView(color: UIColor, text: String, imageName: String) -> UIView {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = color
        cardView.layer.cornerRadius = 10
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        cardView.addSubview(imageView)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        cardView.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
        ])
        
        return cardView
    }
    @objc func handleCardTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let tappedCardIndex = gestureRecognizer.view?.tag else {
            return
        }
        
        switch tappedCardIndex {
        case 0:
            // Navigate to the first view controller
           print("nav")
        case 1:
            // Navigate to the second view controller
            print("nav2")
        
        default:
            break
        }
    }
}
