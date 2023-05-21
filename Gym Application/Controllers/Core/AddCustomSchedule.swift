//
//  AddCustomSchedule.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-21.
//

import UIKit
import FirebaseDatabase
class AddCustomSchedule: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var scheduleData: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    // Implement UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = Array(scheduleData.keys)[indexPath.row]
        let value = scheduleData[key]
        cell.textLabel?.text = "\(key): \(value ?? "")"
        return cell
    }

    // Fetch the data from Firebase
    func fetchDataFromFirebase() {
        let databaseRef = Database.database().reference()
        let documentId = "1001"
        let childRef = databaseRef.child("customschedule").child(documentId)
        
        childRef.observeSingleEvent(of: .value) { [weak self] (snapshot) in
            if let value = snapshot.value as? [String: Any] {
                self?.scheduleData = value
                self?.tableView.reloadData()
                print(value)
            }
        }
    }
}
