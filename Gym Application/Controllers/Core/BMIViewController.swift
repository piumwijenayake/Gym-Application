////
////  BMIViewController.swift
////  Gym Application
////
////  Created by Piumi Wijenayake on 2023-05-09.
////
//
import UIKit
class BMIViewController: UIViewController {
    var recieved: String?
    var data1: String?
    var data2: String?
    var data3: String?
    var data4: String?
    weak var delegate: DataDelegate?
    private let headerView = Header(title: "BMI Calculator", subTitle: "")
    private let dataLabel = UILabel()
    private let dataLabel1 = UILabel()
    private let imageView = UIImageView(image: UIImage(named: "obsesse"))
    private let imageViews = UIImageView(image: UIImage(named: "obsesse"))
    private let heigths = LabelView(title: "Height:")
    private let weights = LabelView(title: "Weight")
    private let calculate = CustomButton(title: "Claculate BMI", hasBackground: true, fontSize: .small)
    let customView = CustomView()
    private let imageView1 = UIImageView()
    let height: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 50, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Height in m"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        // textField.delegate = self
        return textField
    }()
    
    let weight: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Weight in Kg"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        // textField.delegate = self
        return textField
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        self.calculate.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        
        setupUI()
        
        
        
        
        
    }
    private func setupUI() {
        view.backgroundColor = .black
        
        
        
        
        view.addSubview(headerView)
        view.addSubview(heigths)
        view.addSubview(height)
        view.addSubview(weights)
        view.addSubview(weight)
        self.view.addSubview(calculate)
        view.addSubview(dataLabel1)
        view.addSubview(dataLabel)
        view.addSubview(imageView)
        
        //view.addSubview(stackView)
        //view.addSubview(rectangleView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        heigths.translatesAutoresizingMaskIntoConstraints = false
        height.translatesAutoresizingMaskIntoConstraints = false
        weights.translatesAutoresizingMaskIntoConstraints = false
        weight.translatesAutoresizingMaskIntoConstraints = false
        calculate.translatesAutoresizingMaskIntoConstraints = false
         dataLabel1.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heigths.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 170),
            heigths.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            height.topAnchor.constraint(equalTo: heigths.bottomAnchor, constant: 100),
            height.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            height.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            height.heightAnchor.constraint(equalToConstant: 55),
            
            weights.topAnchor.constraint(equalTo: height.bottomAnchor, constant: -40),
            weights.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            weight.topAnchor.constraint(equalTo: weights.bottomAnchor, constant: 90),
            weight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weight.heightAnchor.constraint(equalToConstant: 55),
            // age.heightAnchor.constraint(equalToConstant: 50),
            calculate.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 20),
            calculate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculate.heightAnchor.constraint(equalToConstant: 55),

           
            dataLabel1.topAnchor.constraint(equalTo: calculate.bottomAnchor, constant: 30),
            dataLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 190),
            dataLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataLabel1.heightAnchor.constraint(equalToConstant: 55),
            
            dataLabel.topAnchor.constraint(equalTo: dataLabel1.bottomAnchor, constant: 10),
            dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataLabel.heightAnchor.constraint(equalToConstant: 55),

            imageView.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 190),
            
        ])
        
        
    }
    @objc func calculateBMI(){
        guard let heightText = height.text, let weightText = weight.text else {
              print("Error: Height or weight is nil.")
              return
          }
          
          guard let heightVal = Double(heightText), let weightVal = Double(weightText) else {
              print("Error: Failed to convert height or weight to Double.")
              return
          }
        
          let bmi = weightVal / (heightVal * heightVal)
         
         dataLabel1.text = String(format: "%.2f", bmi)
         dataLabel1.textColor = .white
         
          
          let overweightThreshold: Double = 25
          let underweightThreshold: Double = 18.5
        let   obessetreshold: Double = 29.9
          if bmi > overweightThreshold {
              dataLabel.text = "OOPS! You are Overweight"
              dataLabel.textColor = .white
              imageView.isHidden = false
          
                      // Add the image view to the view hierarchy
                 view.addSubview(imageView)
          } else if bmi < underweightThreshold {
              dataLabel.text = "OOPS! You are Underweight"
              imageView.isHidden = true
          }
         else if bmi < underweightThreshold {
            dataLabel.text = "OOPS! You are Obsesse"
            imageView.isHidden = true
        }
        else {
              dataLabel.text = "Congratulations! You are Normal"
          }
          
          print("BMI: \(bmi)")
        
    }
}
