//
//  CreateAccountViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-13.
//

import UIKit

class CreateAccountViewController: UIViewController {

    private let headerView = AuthView(title: "Sign Up", subTitle: "Create your own Accout and see the wonders")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email )
    private let phonefield = CustomTextField(fieldType: .password)
    private let passwordField = CustomTextField(fieldType: .password)
    private let confirmPasswordField = CustomTextField(fieldType: .confirmPassword)
     
    private let registerButton = CustomButton(title: "Register User", hasBackground: true, fontSize: .big)
    private let termsTextView: UITextView = {
          
           
            let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
            attributedString.addAttribute(.link, value: "terms://TermsAndConditions", range:(attributedString.string as NSString).range(of: "Terms & Conditions"))
            attributedString.addAttribute(.link, value: "privacy://PrivacyPolicy", range:(attributedString.string as NSString).range(of: "Privacy Policy"))
           let tv = UITextView()
           tv.linkTextAttributes = [.foregroundColor: UIColor.blue]
           tv.backgroundColor = .clear
           tv.attributedText = attributedString
           tv.textColor = .white
           tv.isSelectable = true
           tv.delaysContentTouches = false
           tv.isEditable = false
           tv.isScrollEnabled = false
           return tv
       }()
    private let signInButton = CustomButton(title: "Already An User? Login Account", fontSize: .med)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.termsTextView.delegate = self
        self.registerButton.addTarget(self, action: #selector(didRegister), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didLogin), for: .touchUpInside)
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .black
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(phonefield)
        self.view.addSubview(passwordField)
        self.view.addSubview(confirmPasswordField)
        self.view.addSubview(registerButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
         
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        phonefield.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.phonefield.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.phonefield.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.phonefield.heightAnchor.constraint(equalToConstant: 55),
            self.phonefield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: phonefield.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.confirmPasswordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.confirmPasswordField.heightAnchor.constraint(equalToConstant: 55),
            self.confirmPasswordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.registerButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 55),
            self.registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
        ])
    }
    
    // MARK: - Selectors
    @objc func didRegister(){
        print("register now")
    }
 
    @objc private func didLogin() {
        let vc = SignInViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc private func didTapForgotPassword() {
        print("DEBUG PRINT:", "didTapForgotPassword")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CreateAccountViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        
        return true
    }
    private func showWebViewerController(with urlString: String) {
            let vc = WebViewController(with: urlString)
            let nav = UINavigationController(rootViewController: vc)
            self.present(nav, animated: true, completion: nil)
        }
    func textViewDidChangeSelection(_ textView: UITextView) {
           textView.delegate = nil
           textView.selectedTextRange = nil
           textView.delegate = self
       }
        
}
