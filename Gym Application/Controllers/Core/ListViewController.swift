//
//  ListViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-19.
//

import UIKit
import FirebaseDatabase
import Kingfisher
class ListViewController: UIViewController {
        private var exercises: [Exercise] = []
        private let collectionView: UICollectionView
        
        init() {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 120, height: 160)
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Exercise List"
            setupCollectionView()
            fetchExercises()
        }
        
        private func setupCollectionView() {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(ExerciseTableViewCell.self, forCellWithReuseIdentifier: "ExerciseCell")
            view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
    private func fetchExercises() {
            let exercisesRef = Database.database().reference().child("Exercises")
            exercisesRef.observe(.value) { [weak self] snapshot in
                guard let snapshotValue = snapshot.value as? [String: Any] else { return }
                var exercises: [Exercise] = []
                for (exerciseID, exerciseData) in snapshotValue {
                    if let exerciseDict = exerciseData as? [String: Any],
                       let name = exerciseDict["name"] as? String,
                       let duration = exerciseDict["duration"] as? Int,
                       let imageURL = exerciseDict["image"] as? String,
                       let mode = exerciseDict["mode"] as? String,
                       let bodyPart = exerciseDict["bodyPart"] as? String,
                       let catergory = exerciseDict["catergory"] as? String,
                        let goal = exerciseDict["goal"] as? String,
                       let medical = exerciseDict["medical"] as? String
                       
                    {
                        print(name)
                        print(duration)
                        print(imageURL)
                        print(mode)
                        print(bodyPart)
                       // print(name,duration,imageURL,mode,bodyPart,catergory,goal,medical)
                        let exercise = Exercise(name: name, duration: duration, imageURL: imageURL,medical: medical,bodyPart:bodyPart,catergory:catergory,mode: mode,goa: goal)
                        exercises.append(exercise)
                    }
                        }
                        self?.exercises = exercises
                        self?.collectionView.reloadData()
                    }
                }
            }

           extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
               func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                   return exercises.count
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCell", for: indexPath) as? ExerciseTableViewCell else {
                       return UICollectionViewCell()
                   }
                   let exercise = exercises[indexPath.item]
                   cell.configure(with: exercise)
                   return cell
               }
           }
