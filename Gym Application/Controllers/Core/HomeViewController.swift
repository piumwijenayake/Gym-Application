//
//  HomeViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-09.
//

import UIKit

class HomeViewController: UIViewController {
    

    private let titleName: UILabel={
        let titleName = UILabel()
        titleName.center = CGPoint(x: 120, y: 100)
        titleName.textAlignment = .center
        titleName.text = "Home"
        titleName.font = UIFont.boldSystemFont(ofSize: 30)
        titleName.textColor = .black
        titleName.translatesAutoresizingMaskIntoConstraints = false
        
        return titleName
        
            
            
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(titleName)
        

        // Do any additional setup after loading the view.
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
