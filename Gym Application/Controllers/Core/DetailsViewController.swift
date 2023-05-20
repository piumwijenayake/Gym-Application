//
//  DetailsViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-20.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseDatabase

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var databaseRef: DatabaseReference!
    var dataSource: [ExerciseListOne] = []
    var documentID:String!
    var detailsLabel: UILabel!
    var details: UILabel!
    var catergoryLabel: UILabel!
    var catergory: UILabel!
    var durationLabel: UILabel!
    var duration: UILabel!
    var modeLabel: UILabel!
    var mode: UILabel!
    var bodyPartLabel: UILabel!
    var bodyPart: UILabel!
    var goalLabel: UILabel!
    var goal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Firebase Database reference
        databaseRef = Database.database().reference()
        
        // Create UITableView programmatically
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseDetailViewTableViewCell.self, forCellReuseIdentifier: "ExerciseCell")

        view.addSubview(tableView)
        detailsLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        detailsLabel.textColor = .black
        detailsLabel.text = "Details"
        detailsLabel.font = UIFont.systemFont(ofSize: 18)
        
        view.addSubview(detailsLabel)
        details = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        details.textColor = .black
        details.font = UIFont.systemFont(ofSize: 13)
        details.numberOfLines = 0
        self.view.addSubview(details)
        catergoryLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        catergoryLabel.textColor = .black
        catergoryLabel.text = "Catergory"
        catergoryLabel.font = UIFont.systemFont(ofSize: 18)
        
        view.addSubview(catergoryLabel)
        catergory = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        catergory.textColor = .black
        catergory.font = UIFont.systemFont(ofSize: 13)
        catergory.numberOfLines = 0
        self.view.addSubview(catergory)
        modeLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        modeLabel.textColor = .black
        modeLabel.text = "Mode"
        modeLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(modeLabel)
        mode = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        mode.textColor = .black
        mode.font = UIFont.systemFont(ofSize: 15)
        mode.numberOfLines = 0
        
        view.addSubview(mode)
        
        durationLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        durationLabel.textColor = .black
        durationLabel.text = "Duration"
        durationLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(durationLabel)
        duration = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        duration.textColor = .black
        duration.font = UIFont.systemFont(ofSize: 15)
        duration.numberOfLines = 0
        
        view.addSubview(duration)
        
        bodyPartLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        bodyPartLabel.textColor = .black
        bodyPartLabel.text = "Body Part"
        bodyPartLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(bodyPartLabel)
        bodyPart = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        bodyPart.textColor = .black
        bodyPart.font = UIFont.systemFont(ofSize: 15)
        bodyPart.numberOfLines = 0
        view.addSubview(bodyPart)
        goalLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        goalLabel.textColor = .black
        goalLabel.text = "Our Goal"
        goalLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(goalLabel)
        goal = UILabel()
        //details.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        goal.textColor = .black
        goal.font = UIFont.systemFont(ofSize: 15)
       
        
        view.addSubview(goal)
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        details.translatesAutoresizingMaskIntoConstraints = false
        modeLabel.translatesAutoresizingMaskIntoConstraints = false
        mode.translatesAutoresizingMaskIntoConstraints = false
        catergoryLabel.translatesAutoresizingMaskIntoConstraints = false
        catergory.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        duration.translatesAutoresizingMaskIntoConstraints = false
        bodyPartLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyPart.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        goal.translatesAutoresizingMaskIntoConstraints = false
        details.widthAnchor.constraint(equalToConstant: 370).isActive = true
        goal.widthAnchor.constraint(equalToConstant: 370).isActive = true
        details.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true

        NSLayoutConstraint.activate([
           detailsLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -470),
           detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           detailsLabel.heightAnchor.constraint(equalToConstant: 30),
           
           //details.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: -330),
           details.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           details.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 420),
           details.widthAnchor.constraint(equalToConstant: 900),
           details.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
           
           catergoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           catergoryLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 490),
           catergoryLabel.widthAnchor.constraint(equalToConstant: 100),
           catergoryLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
           
           catergory.leadingAnchor.constraint(equalTo: catergoryLabel.trailingAnchor, constant: 190),
           catergory.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 490),
           catergory.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
           catergory.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
          
           modeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           modeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 530),
           modeLabel.widthAnchor.constraint(equalToConstant: 100),
           modeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),

           mode.leadingAnchor.constraint(equalTo: modeLabel.trailingAnchor, constant: 170),
           mode.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 530),
           mode.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
           mode.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
           
           durationLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           durationLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 580),
           durationLabel.widthAnchor.constraint(equalToConstant: 100),
           durationLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),

           duration.leadingAnchor.constraint(equalTo: durationLabel.trailingAnchor, constant: 190),
           duration.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 580),
           duration.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
           duration.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
           
           bodyPartLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           bodyPartLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 630),
           bodyPartLabel.widthAnchor.constraint(equalToConstant: 100),
           bodyPartLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),

           bodyPart.leadingAnchor.constraint(equalTo: bodyPartLabel.trailingAnchor, constant: 190),
           bodyPart.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 630),
           bodyPart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
           bodyPart.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
           
           goalLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
           goalLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 680),
           goalLabel.widthAnchor.constraint(equalToConstant: 100),
           goalLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),

           goal.leadingAnchor.constraint(equalTo: goalLabel.trailingAnchor, constant: 170),
           goal.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 680),
           goal.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
           goal.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
           
           ])
        guard let docID = documentID else {
            // Handle the case when documentID is nil
            return
        }
        // Load data from Firebase
        loadDataFromFirebase(with: docID)
    }
    
    func loadDataFromFirebase(with documentID: String) {
        print(documentID)
        let ref = databaseRef.child("Exercises").child(documentID)

        ref.observeSingleEvent(of: .value) { (snapshot) in
            if let dataDict = snapshot.value as? [String: Any] {
                let name = dataDict["name"] as? String ?? ""
                let imageURL = dataDict["image"] as? String ?? ""
                let details = dataDict["details"] as? String ?? ""
                let mode = dataDict["mode"] as? String ?? ""
                let duration = dataDict["duration"] as? String ?? ""
                let part = dataDict["bodyPart"] as? String ?? ""
                let goals = dataDict["goal"] as? String ?? ""
                let catergory = dataDict["catergory"] as? String ?? ""
                let recordID = snapshot.key
                let data = ExerciseListOne(name: name, image:imageURL, recordID:recordID, details:details,mode: mode,duration: duration,bodyPart: part,goal: goals,catergory: catergory)
                print("data",data)
                self.dataSource.append(data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.details.text = details
                    self.mode.text = mode
                    self.duration.text = duration
                    self.bodyPart.text = part
                    self.goal.text = goals
                    self.catergory.text = catergory
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseDetailViewTableViewCell
            
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
