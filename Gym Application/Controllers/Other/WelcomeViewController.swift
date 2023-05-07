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
    override func viewDidLoad() {
        super.viewDidLoad()
        

        title = "Stay Fit"
      
        

        view.backgroundColor = .gray
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didSignIn), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
