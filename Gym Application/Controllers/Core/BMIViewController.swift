////
////  BMIViewController.swift
////  Gym Application
////
////  Created by Piumi Wijenayake on 2023-05-09.
////
//
import UIKit
class BMIViewController: UIViewController {
    var recieved: String?
    //    var imageView1: UIImageView!
    //    var imageView2: UIImageView!
    //
    //    var selectedImage1: Bool = false
    //    var selectedImage2: Bool = false
    //    var selectedTitle: String?
    //
    //   override func viewDidLoad() {
    //      super.viewDidLoad()
    //
    //
    //            imageView1 = UIImageView(image: UIImage(named: "femaleVector"))
    //            imageView1.isUserInteractionEnabled = true
    //
    //            let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
    //            imageView1.addGestureRecognizer(tapGesture1)
    //
    //            imageView2 = UIImageView(image: UIImage(named: "maleVector"))
    //            imageView2.isUserInteractionEnabled = true
    //
    //            let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
    //            imageView2.addGestureRecognizer(tapGesture2)
    //
    //            setupUI()
    //            if let selectedTitle = selectedTitle {
    //                   print("Selected title: \(selectedTitle)")
    //                   // Update your UI or perform any other necessary actions with the selected title
    //               }
    //        }
    //
    //    @IBAction func presentGenderViewController(_ sender: UIButton) {
    //           let genderViewController = GenderViewController()
    //           let anotherViewController = self
    //           genderViewController.delegate = anotherViewController
    //           present(genderViewController, animated: true, completion: nil)
    //       }
    //    func didSelectGender(_ gender: String) {
    //          print("Selected gender: \(gender)")
    //          // Handle the selected gender as needed
    //      }
    //
    //    private func setupUI() {
    //        view.addSubview(imageView1)
    //        view.addSubview(imageView2)
    //
    //        imageView1.translatesAutoresizingMaskIntoConstraints = false
    //        imageView2.translatesAutoresizingMaskIntoConstraints = false
    //
    //        NSLayoutConstraint.activate([
    //            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
    //            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
    //            imageView1.widthAnchor.constraint(equalToConstant: 150),
    //            imageView1.heightAnchor.constraint(equalToConstant: 150),
    //
    //            imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
    //            imageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
    //            imageView2.widthAnchor.constraint(equalToConstant: 150),
    //            imageView2.heightAnchor.constraint(equalToConstant: 150)
    //        ])
    //    }
    //
    //
    //    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
    //        if let imageView = sender.view as? UIImageView {
    //            if imageView == imageView1 {
    //                selectedImage1 = !selectedImage1
    //                if selectedImage1 {
    //                    imageView1.layer.borderColor = UIColor.blue.cgColor
    //                    imageView1.layer.borderWidth = 2.0
    //                    // Add additional customization for the selected state
    //                } else {
    //                    imageView1.layer.borderColor = nil
    //                    imageView1.layer.borderWidth = 0.0
    //                    // Reset the customization for the unselected state
    //                }
    //            } else if imageView == imageView2 {
    //                selectedImage2 = !selectedImage2
    //                if selectedImage2 {
    //                    imageView2.layer.borderColor = UIColor.blue.cgColor
    //                    imageView2.layer.borderWidth = 2.0
    //                    // Add additional customization for the selected state
    //                } else {
    //                    imageView2.layer.borderColor = nil
    //                    imageView2.layer.borderWidth = 0.0
    //                    // Reset the customization for the unselected state
    //                }
    //            }
    //        }
    //        }
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Another View Controller"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Gender", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let recieved = recieved {
                print("Received title in BMIViewController: \(recieved)")
                // Use the received title as needed
            }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(genderButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            genderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
    
    
    
    
}
