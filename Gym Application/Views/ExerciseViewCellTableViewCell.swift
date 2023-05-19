//
//  ExerciseViewCellTableViewCell.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-20.
//

import UIKit


class ExerciseTableViewCell: UICollectionViewCell {
    private let exerciseImageView = UIImageView()
    private let nameLabel = UILabel()
    private let durationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        contentView.addSubview(exerciseImageView)
        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            exerciseImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            exerciseImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            exerciseImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLabels() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(durationLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: exerciseImageView.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            durationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with exercise: Exercise) {
        nameLabel.text = exercise.name
        durationLabel.text = "Duration: \(exercise.duration) minutes"
        if let imageURL = URL(string: exercise.imageURL) {
            exerciseImageView.kf.setImage(with: imageURL)
        }
    }
}
