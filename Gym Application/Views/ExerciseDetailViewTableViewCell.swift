//
//  ExerciseDetailViewTableViewCell.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-20.
//

import UIKit

class ExerciseDetailViewTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
        var playPauseButton: UIButton!
        var stopButton: UIButton!
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            nameLabel = UILabel(frame: CGRect(x: 20, y: 10, width: contentView.bounds.width - 40, height: 30))
            contentView.addSubview(nameLabel)
            
            playPauseButton = UIButton(type: .system)
            playPauseButton.setTitle("Play", for: .normal)
            playPauseButton.frame = CGRect(x: 20, y: 50, width: 80, height: 30)
            contentView.addSubview(playPauseButton)
            
            stopButton = UIButton(type: .system)
            stopButton.setTitle("Stop", for: .normal)
            stopButton.frame = CGRect(x: 120, y: 50, width: 80, height: 30)
            contentView.addSubview(stopButton)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }


