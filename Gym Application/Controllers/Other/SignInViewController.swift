//
//  SignInViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-13.
//

import UIKit
import Firebase
import FirebaseDatabase
class SignInViewController: UIViewController {
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // MARK: - UI Components
       private let headerView = AuthView(title: "Sign In", subTitle: "Sign in to your account")

       private let usernameField = CustomTextFields(fieldType: .username)
       private let passwordField = CustomTextFields(fieldType: .password)

       private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
       private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .med)
       private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small)
       private let databaseRef = Database.database().reference()

       // MARK: - LifeCycle
       override func viewDidLoad() {
           super.viewDidLoad()
           self.setupUI()

           self.signInButton.addTarget(self, action: #selector(didSignIn), for: .touchUpInside)
         //  self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
             //  self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)

       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.navigationController?.navigationBar.isHidden = false
       }

       // MARK: - UI Setup
       private func setupUI() {
          view.backgroundColor = .black

           self.view.addSubview(headerView)
           self.view.addSubview(usernameField)
           self.view.addSubview(passwordField)
           self.view.addSubview(signInButton)
           self.view.addSubview(newUserButton)
           self.view.addSubview(forgotPasswordButton)

           headerView.translatesAutoresizingMaskIntoConstraints = false
           usernameField.translatesAutoresizingMaskIntoConstraints = false
           passwordField.translatesAutoresizingMaskIntoConstraints = false
           signInButton.translatesAutoresizingMaskIntoConstraints = false
           newUserButton.translatesAutoresizingMaskIntoConstraints = false
           forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

           NSLayoutConstraint.activate([
               self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
               self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
               self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
               self.headerView.heightAnchor.constraint(equalToConstant: 222),

               self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
               self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
               self.usernameField.heightAnchor.constraint(equalToConstant: 55),
               self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

               self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
               self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
               self.passwordField.heightAnchor.constraint(equalToConstant: 55),
               self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

               self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
               self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
               self.signInButton.heightAnchor.constraint(equalToConstant: 55),
               self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

               self.newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
               self.newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
               self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
               self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

               self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6),
               self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
               self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
               self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
           ])
       }

       // MARK: - Selectors
    @objc func didSignIn(){
        let enteredEmail = usernameField.text
        let enteredPassword = passwordField.text
               
               // Check if the entered email exists in the Firebase database
        let usersRef = databaseRef.child("users")
        let query = usersRef.queryOrdered(byChild: "username").queryEqual(toValue: enteredEmail)
               
        query.observeSingleEvent(of: .value) { snapshot in
                if snapshot.exists() {
                       // The entered email exists in the database
                       // You can perform any necessary actions here
                       
                       // Example: Get the user's data
                if let userSnapshot = snapshot.children.allObjects.first as? DataSnapshot,
                    let userData = userSnapshot.value as? [String: Any] {
                    let username = userData["username"] as? String
                    let password = userData["password"] as? String
                           
                           // Perform actions with the retrieved user data
                           print("Username: \(username ?? "")")
                           print("Password: \(password ?? "")")
                       }
                       
                       let vc = GenderViewController()
                       vc.modalPresentationStyle = .fullScreen
                       self.present(vc, animated: false, completion: nil)
                   } else {
                       // The entered email does not exist in the database
                       let alert = UIAlertController(title: "Login Failed", message: "Invalid email or password", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                       alert.addAction(okAction)
                       self.present(alert, animated: true, completion: nil)
                   }
               }
           }
       }
