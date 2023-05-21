//
//  ExeerciseFitnessViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-22.
//

import UIKit

class ExeerciseFitnessViewController: UITableViewCell {

    private var customImageView: UIImageView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    var actionButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Create and configure the image view
        customImageView = UIImageView()
        customImageView.contentMode = .scaleAspectFill
        customImageView.clipsToBounds = true
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customImageView)
                
                // Configure the title label
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
                
                // Configure the subtitle label
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        
        actionButton = UIButton(type: .system)
        actionButton.setTitle("More", for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(actionButton)
                
                // Add constraints for the image view
        NSLayoutConstraint.activate([
                   customImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                   customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                   customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                   customImageView.heightAnchor.constraint(equalToConstant: 200),
                   //customImageView.widthAnchor.constraint(equalToConstant: 200) ,
                   
                   titleLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 8),
                   titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                   titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                   
                 
                   subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                    subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                   subtitleLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: 8),

                   
                   actionButton.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor),
                   actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
// Adjust the height of the image view as needed
               ])
                   contentView.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8).isActive = true
            }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withData data: ExerciseData) {
        
            titleLabel.text = data.name
           // subtitleLabel.text = data.mode
            
            customImageView.image = UIImage(named: "placeholderImage") // Set your placeholder image name here
            
        if let imageURL = URL(string: data.image) {
                customImageView.kf.setImage(with: imageURL) { result in
                    switch result {
                    case .success(let value):
                        // Image loaded successfully
                        DispatchQueue.main.async {
                            self.customImageView.image = value.image
                        }
                    case .failure(let error):
                        // Error occurred while loading the image
                        print("Image loading error: \(error)")
                        DispatchQueue.main.async {
                            self.customImageView.image = UIImage(named: "placeholderImage") // Set your placeholder image name here
                        }
                    }
                }
            } else {
                // Invalid image URL, set a placeholder image
                customImageView.image = UIImage(named: "placeholderImage") // Set your placeholder image name here
            }
        }
    }







