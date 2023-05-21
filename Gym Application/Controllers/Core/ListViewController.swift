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
    var data:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        // Initialize Firebase Database reference
        databaseRef = Database.database().reference()
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.backgroundColor = .black

        // Create an icon view
        let iconView = UIImageView(image: UIImage(systemName: "power"))
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit

        // Create a label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)

        // Add the icon view and label to the stack view
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(label)

        // Add the stack view to the parent view
        view.addSubview(stackView)

        
        // Create UITableView programmatically
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    tableView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 120),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                ])
        // Load data from Firebase
        loadDataFromFirebase()
        
      
    }
    
    func loadDataFromFirebase() {
        databaseRef.child("Exercises").observe(.childAdded) { (snapshot) in
            if let dataDict = snapshot.value as? [String: Any] {
                let name = dataDict["name"] as? String ?? ""
                let imageURL = dataDict["image"] as? String ?? ""
                let mode = dataDict["mode"] as? String ?? ""
                let recordID = snapshot.key
                let data = Exercise(name: name, imageURL: imageURL, mode: mode,recordID: recordID)
                print(data)
                self.dataSource.append(data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    @objc func buttonTapped(_ sender: UIButton) {
          let selectedData = dataSource[sender.tag]
          let documentID = selectedData.recordID
          print("Selected document ID:", documentID)
          let detailViewController = DetailsViewController()
                
                // Set the document ID property of the destination view controller
          detailViewController.documentID = documentID
                
                // Present the destination view controller
        self.navigationController?.pushViewController(detailViewController, animated: true)

          
          // Perform any operations based on the selected document ID
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell
            
        let data = dataSource[indexPath.row]
        cell.configure(withData: data)
        cell.actionButton.tag = indexPath.row // Set the row index as the button tag
        cell.actionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = dataSource[indexPath.row]
        let documentID = selectedData.recordID
        print("Selected document ID:", documentID)
            
            // Perform any additional operations or navigation based on the selected document ID
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 // Adjust the estimated height of the rows
    }
    
}
