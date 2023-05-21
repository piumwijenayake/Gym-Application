//
//  CustomScheduleViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-21.
//

import UIKit
import FirebaseDatabase
class CustomScheduleViewController:UIViewController {
    var textField: UITextField!
    var Header: UILabel!
    var subLabel: UILabel!
    var label: UILabel!
    var datepickLabel: UILabel!
    var datePicker: UIDatePicker!
    var timePicker: UIDatePicker!
    var timePickerLabel: UILabel!
    var selectedDateLabel: UILabel!
    var data:String!
    
    // private let headerView = AuthView(title: "Custom Schedule", subTitle: "Time to Create Your Schedule")
    //var doneButton: UIButton!
    var button: UIButton!
    var viewButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //title = "Custom Schedule"
        let backgroundImage = UIImage(named: "catergory0")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        // Create the text field
        textField = UITextField()
        //headerView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        
        // textField.backgroundColor = .white
        
        Header = UILabel()
        Header.translatesAutoresizingMaskIntoConstraints = false
        Header.text = "Custom Schedule"
        Header.textAlignment = .center
        Header.textColor = .white
        Header.font = UIFont.systemFont(ofSize: 23)
        subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "Create Your Own Schedule"
        subLabel.textAlignment = .center
        subLabel.textColor = .white
        
        // Create the label
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Description"
        label.textAlignment = .center
        label.textColor = .white
        
        
        datepickLabel = UILabel()
        datepickLabel.translatesAutoresizingMaskIntoConstraints = false
        datepickLabel.text = "Date To Workout"
        datepickLabel.textAlignment = .center
        datepickLabel.textColor = .white
        
        view.addSubview(Header)
        view.addSubview(subLabel)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(datepickLabel)
        
        // Create the date picker
        datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        view.addSubview(datePicker)
        
        // Create the label to display selected date
        selectedDateLabel = UILabel()
        selectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedDateLabel.textAlignment = .center
        selectedDateLabel.textColor = .white
        view.addSubview(selectedDateLabel)
        
        // Create the done button
        
        timePickerLabel = UILabel()
        timePickerLabel.translatesAutoresizingMaskIntoConstraints = false
        timePickerLabel.text = "Workout Time"
        timePickerLabel.textAlignment = .center
        timePickerLabel.textColor = .white
        timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = .white
        view.addSubview(timePickerLabel)
        view.addSubview(timePicker)
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        viewButton = UIButton(type: .system)
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.setTitle("View", for: .normal)
        viewButton.backgroundColor = .black
        viewButton.tintColor = .white
        viewButton.addTarget(self, action: #selector(buttonOpened), for: .touchUpInside)
        view.addSubview(viewButton)
        
        // Set up layout constraints
        NSLayoutConstraint.activate([
            Header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Header.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            Header.widthAnchor.constraint(equalToConstant: 200),
            
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLabel.topAnchor.constraint(equalTo: Header.bottomAnchor, constant: 18),
            subLabel.widthAnchor.constraint(equalToConstant: 400),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: subLabel.topAnchor, constant: 100),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            // Label Constraints
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-20),
            //Label
            datePicker.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            datepickLabel.trailingAnchor.constraint(equalTo: datePicker.leadingAnchor, constant: 30),
            datepickLabel.centerYAnchor.constraint(equalTo: datePicker.centerYAnchor),
            datepickLabel.widthAnchor.constraint(equalToConstant: 200),
            
            
            
            
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            datePicker.widthAnchor.constraint(equalToConstant: 90),
            
           
            
            timePickerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            timePickerLabel.trailingAnchor.constraint(equalTo: timePicker.leadingAnchor, constant: 20),
            timePickerLabel.centerYAnchor.constraint(equalTo: timePicker.centerYAnchor),
            timePickerLabel.widthAnchor.constraint(equalToConstant: 200),
            
            timePicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            timePicker.leadingAnchor.constraint(equalTo: timePickerLabel.trailingAnchor, constant: -5),
            timePicker.widthAnchor.constraint(equalToConstant: 200),
            timePicker.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
            viewButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            viewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewButton.widthAnchor.constraint(equalToConstant: 200),
            viewButton.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
        
    }
    @objc func buttonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        let selectedDate = datePicker.date
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        selectedDateLabel.text = formattedDate
        
        dateFormatter.timeStyle = .short
        
        let selectedTime = timePicker.date
        let formattedTime = dateFormatter.string(from: selectedTime)
        print(selectedDate)
        print(selectedTime)
        
        // Handle the selected date as needed
        
        // Dismiss the custom date picker
        dismiss(animated: true, completion: nil)
        
        print(data)
        let databaseRef = Database.database().reference()
        let data: [String: Any] = [
            "name": textField.text ?? "",
            "time": formattedDate,
            "date": formattedTime,
            // Add more key-value pairs as needed
        ]
        let documetid="1001"
        let childRef = databaseRef.child("customschedule").child(documetid)
        
        // Use the child reference to set the data
        childRef.setValue(data) { error, _ in
            if let error = error {
                print("Error saving data to Firebase: \(error.localizedDescription)")
            } else {
                print("Data saved successfully")
            }
            
        }
    }
    @objc func buttonOpened() {
        let vc = AddCustomSchedule()
        navigationController?.pushViewController(vc, animated: false)
        

    }
}

