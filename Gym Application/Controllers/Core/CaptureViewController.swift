import UIKit
import FirebaseDatabase
class CaptureViewController: UIViewController {
    // MARK: - UI Components
    private let contentView = UIView()
    private let headerView = Header(title: "Let's Get To Know More", subTitle: "Tell Us Your Physical Attributes And Habits")
    private let genderLabel = LabelView(title: "Gender:")
    private let ageLabel = LabelView(title: "Age:")
    private let heightLabel = LabelView(title: "Height:")
    private let weightLabel = LabelView(title: "Weight:")
    private let medical = LabelView(title: "Medical Conditions:")
    private let goal = LabelView(title: "Fitness Goal:")
    var selectedTitle: String?
    let destinationVC = BMIViewController()
    private var recieved: String?
    var data: String?
    
    
    private let nextButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)
    let age: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 10, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Age"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        // textField.delegate = self
        return textField
        }()
        
    let height: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 50, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Height"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
            // textField.delegate = self
        return textField
        }()
        
        let weight: UITextField = {
            let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter Weight"
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.white
            // textField.delegate = self
            return textField
        }()
        
        let medicals: UITextField = {
            let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter Medicine"
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.white
            // textField.delegate = self
            return textField
        }()
        
        let fitness: UITextField = {
            let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter Fitness"
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.white
            // textField.delegate = self
            return textField
        }()
          
        override func viewDidLoad() {
            super.viewDidLoad()
            //destinationVC.delegate = self
            setupUI()
            self.nextButton.addTarget(self, action: #selector(didNext), for: .touchUpInside)
            
           
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.isHidden = false
        }
   
        // MARK: - UI Setup
        private func setupUI() {
            view.backgroundColor = .black
            
            // Add contentView
            view.addSubview(contentView)
            
            // Add UI components to contentView
            contentView.addSubview(headerView)
            contentView.addSubview(ageLabel)
            contentView.addSubview(age)
            contentView.addSubview(heightLabel)
            contentView.addSubview(height)
            contentView.addSubview(weightLabel)
            contentView.addSubview(weight)
            contentView.addSubview(medical)
            contentView.addSubview(medicals)
            contentView.addSubview(goal)
            contentView.addSubview(fitness)
            contentView.addSubview(nextButton)
            // Disable autoresizing mask translation for flexible constraints
            [contentView, headerView, heightLabel, ageLabel,age,height, weightLabel, weight,medical,medicals,goal,fitness,nextButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
            
            // Set contentView constraints
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                            
                headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -110),
                headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                            
                ageLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 170),
                ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
                          
                age.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 100),
                age.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                age.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                age.heightAnchor.constraint(equalToConstant: 45),

                heightLabel.topAnchor.constraint(equalTo: age.bottomAnchor, constant: -40),
                heightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
                          
                height.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 90),
                height.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                height.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                height.heightAnchor.constraint(equalToConstant: 45),
                          
                weightLabel.topAnchor.constraint(equalTo: height.bottomAnchor, constant: -40),
                weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
                          
                weight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 90),
                weight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                weight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                weight.heightAnchor.constraint(equalToConstant: 45),
                
                medical.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: -40),
                medical.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
                          
                medicals.topAnchor.constraint(equalTo: medical.bottomAnchor, constant: 90),
                medicals.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                medicals.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                medicals.heightAnchor.constraint(equalToConstant: 45),
                
                goal.topAnchor.constraint(equalTo: medicals.bottomAnchor, constant: -40),
                goal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:90),
                          
                fitness.topAnchor.constraint(equalTo: goal.bottomAnchor, constant: 90),
                fitness.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                fitness.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                fitness.heightAnchor.constraint(equalToConstant: 45),
                
                nextButton.topAnchor.constraint(equalTo: fitness.bottomAnchor, constant: 90),
                nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                nextButton.heightAnchor.constraint(equalToConstant: 45),
    
                
                
                
        
            ])
        }
    @objc private func didNext() {
        let data = data!
        let agetext = age.text
        let heightText = height.text
        let weightText = weight.text
        let mCondition = medicals.text
        let fitnessGoals = fitness.text
        let ref = Database.database().reference().child("users").child(data)

            let updates = [
                "age": agetext!,
                "height": heightText!,
                "weight": weightText!,
                "medical": mCondition!,
                "goal" : fitnessGoals!,
                
            ] as [String : Any]
            
            ref.updateChildValues(updates) { error, _ in
                if let error = error {
                    print("Error updating data: \(error)")
                } else {
                    print("Data updated successfully!")
                    let anotherViewController = ListViewController()
                    
                    
                }
            }
                     // Output: "Hello, World!"
                
         }
  //
    }


