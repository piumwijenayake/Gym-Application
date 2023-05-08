//
//  WelcomeViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-07.
//

import UIKit

class WelcomeViewController: UIViewController {
    //creating sign in button ui
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        //this will be displayed only when the state is normal
        button.setTitle("Lets Get Started", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    private let imageView: UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "wallpaper")
       
        
        return imageView
        
            
            
        
    }()
    private let logo: UIImageView={
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFill
        logo.center = CGPoint(x: 70, y: 100)
        
        
        
        return logo
        
            
            
        
    }()
    private let label: UILabel={
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
   
        label.center = CGPoint(x: 60, y: 894)
        label.textAlignment = .center
        label.text = "Stay Fit"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        
        
        return label
        
            
            
        
    }()
    private let logoName: UILabel={
        let logoName = UILabel(frame: CGRect(x: 0, y: 0, width: 290, height: 32))
   
        logoName.center = CGPoint(x: 120, y: 194)
        logoName.textAlignment = .center
        logoName.text = "Healthy Fitness"
        logoName.font = UIFont.boldSystemFont(ofSize: 30)
        logoName.textColor = .white
        
        
        return logoName
        
            
            
        
    }()
    //Bear witness to Infinity Fitness.
    private let subLabel: UILabel={
        let subLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
   
        subLabel.center = CGPoint(x: 80, y: 950)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 2
        subLabel.lineBreakMode = .byWordWrapping
        subLabel.text = "Bear witness to Infinity Fitness"
        subLabel.font = UIFont.boldSystemFont(ofSize: 20)
        subLabel.textColor = .white
        
        
        return subLabel
        
            
            
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .black
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(logo)
        view.addSubview(logoName)
        view.addSubview(subLabel)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didSignIn), for: .touchUpInside)
       
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Animate the label's position and float into view
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
             self.label.center.y -= (self.view.frame.size.height / 2) - 100 // Move the label down to the center of the screen
         }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
             self.subLabel.center.y -= (self.view.frame.size.height / 2) - 100 // Move the label down to the center of the screen
         }, completion: nil)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        signInButton.frame = CGRect(
            x: 20, y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50)
    }
    @objc func didSignIn(){
        let vc = GenderController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
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
