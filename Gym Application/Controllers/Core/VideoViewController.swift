//
//  VideoViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-21.
//

import UIKit
import FirebaseDatabase
import AVFoundation
class VideoViewController: UIViewController {
    var documentID:String!
    let databaseRef = Database.database().reference()
    // Reference to the AVPlayer
    var player: AVPlayer?
       
       // Reference to the AVPlayerLayer
    var playerLayer: AVPlayerLayer?
    var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addVideo()
        
        createVideo()
       
        // Do any additional setup after loading the view.
    }
    private func createVideo(){
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        let buttonStackView = UIStackView()
            buttonStackView.axis = .horizontal
            buttonStackView.spacing = 16
            buttonStackView.alignment = .center
            buttonStackView.distribution = .fillEqually
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(buttonStackView)
            
            NSLayoutConstraint.activate([
                buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
            
            let playButton = UIButton(type: .system)
            playButton.setTitle("Play", for: .normal)
            playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
            buttonStackView.addArrangedSubview(playButton)
            
            let pauseButton = UIButton(type: .system)
            pauseButton.setTitle("Pause", for: .normal)
            pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
            buttonStackView.addArrangedSubview(pauseButton)
            
            let forwardButton = UIButton(type: .system)
            forwardButton.setTitle("Forward", for: .normal)
            forwardButton.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
            buttonStackView.addArrangedSubview(forwardButton)
            
            let backwardButton = UIButton(type: .system)
            backwardButton.setTitle("Backward", for: .normal)
            backwardButton.addTarget(self, action: #selector(backwardButtonTapped), for: .touchUpInside)
            buttonStackView.addArrangedSubview(backwardButton)
    }
    private func addVideo(){
        let documentid = documentID!
        print(documentid)
        let videoRef = databaseRef.child("Exercises").child(documentid)
        
        videoRef.observeSingleEvent(of: .value) { (snapshot) in
                 if let dataDict = snapshot.value as? [String: Any],
                    let videoURLString = dataDict["video"] as? String,
                    let videoURL = URL(string: videoURLString) {
                     
                     DispatchQueue.main.async {
                         self.playVideo(from: videoURL)
                     }
                 }
             } withCancel: { (error) in
                 print("Error retrieving video URL: \(error.localizedDescription)")
             }
         }
    private func playVideo(from url: URL) {
        // Show the activity indicator
        activityIndicator.startAnimating()
        
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        view.layer.addSublayer(playerLayer!)
        
        // Add observer to monitor the video loading status
        player?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let player = player {
            if player.status == .readyToPlay {
                // Video is ready to play, hide the activity indicator
                activityIndicator.stopAnimating()
            } else if player.status == .failed {
                // Failed to load video, handle error and hide the activity indicator
                activityIndicator.stopAnimating()
                print("Failed to load video: \(player.error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

        
        @objc func playButtonTapped() {
            player?.play()
        }
        
        @objc func pauseButtonTapped() {
            player?.pause()
        }
       @objc func forwardButtonTapped() {
           seekVideo(seconds: 10) // Seek forward by 10 seconds (adjust the value as needed)
       }
       
       @objc func backwardButtonTapped() {
           seekVideo(seconds: -10) // Seek backward by 10 seconds (adjust the value as needed)
       }
       
       func seekVideo(seconds: Double) {
           guard let player = player else {
               return
           }
           
           let currentTime = CMTimeGetSeconds(player.currentTime())
           let targetTime = currentTime + seconds
           
           let time = CMTimeMakeWithSeconds(targetTime, preferredTimescale: Int32(NSEC_PER_SEC))
           player.seek(to: time, completionHandler: { [weak self] (completed) in
               if completed {
                   self?.player?.play() // Resume playback after seeking
               }
           })
       }
}
