//
//  FitnessPlanDetailViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-22.
//

import UIKit
import FirebaseDatabase
class FitnessPlanDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var databaseRef: DatabaseReference!
    var dataSource: [ExercisData] = []
    var data:String!
    var selectedid:String!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   title = "Home"
        
        // Initialize Firebase Database reference
        databaseRef = Database.database().reference()
        
        
        // Create UITableView programmatically
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseFitness.self, forCellReuseIdentifier: "ExerciseCell")
        view.addSubview(tableView)
        
        // Load data from Firebase
        loadDataFromFirebase()
        
        
    }
    
    func loadDataFromFirebase() {
        var id = selectedid!
        print(id)
        let ref = databaseRef.child("ExercisesData").child(id)
        print(ref)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            if let dataDict = snapshot.value as? [String: Any] {
                let name = dataDict["names"] as? String ?? ""
                let imageURL = dataDict["image"] as? String ?? ""
                let durations = dataDict["duration"] as? String ?? ""
                let recordID = snapshot.key
                let data = ExercisData(name: name, image:imageURL,recordID: recordID,duration: durations)
                print("data",data)
                self.dataSource.append(data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                 
                }
            }
        }
    }
    @objc func buttonTapped(_ sender: UIButton) {
//        let selectedData = dataSource[sender.tag]
//        let documentID = selectedData.recordID
//        print("Selected document ID:", documentID)
//        let detailViewController = DetailsViewController()
//
//        // Set the document ID property of the destination view controller
//        detailViewController.documentID = documentID
        //
        //                // Present the destination view controller
        //        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        
        // Perform any operations based on the selected document ID
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseFitness
        
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

