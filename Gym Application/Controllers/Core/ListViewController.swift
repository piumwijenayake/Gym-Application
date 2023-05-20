//
//  ListViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-19.
//

import UIKit
import FirebaseDatabase
import Kingfisher


class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var databaseRef: DatabaseReference!
    var dataSource: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Firebase Database reference
        databaseRef = Database.database().reference()
        
        // Create UITableView programmatically
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        view.addSubview(tableView)
        
        // Load data from Firebase
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        databaseRef.child("Exercises").observe(.childAdded) { (snapshot) in
            if let dataDict = snapshot.value as? [String: Any] {
                let name = dataDict["name"] as? String ?? ""
                let imageURL = dataDict["image"] as? String ?? ""
                let mode = dataDict["mode"] as? String ?? ""
                
                let data = Exercise(name: name, imageURL: imageURL, mode: mode)
                print(data)
                self.dataSource.append(data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    @objc func buttonTapped(sender: UIButton) {
           print("Damn my ass")
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell
        
        let data = dataSource[indexPath.row]
        cell.configure(withData: data)
        cell.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 // Adjust the estimated height of the rows
    }
    
}
