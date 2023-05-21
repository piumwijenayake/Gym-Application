//
//  TabBarControllerViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-09.
//

import UIKit

class TabBarControllerViewController: UITabBarController {
    var data: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        navigationItem.hidesBackButton = true
        setUpTabs()
        let data = data
        print(data)
        
        // Do any additional setup after loading the view.
    }
    private func setUpTabs(){
        let home = ListViewController()
        let search = CaptureViewController()
        let bmi = BMIViewController()
        let schedule = CustomScheduleViewController()
        
        
        let nav1 = UINavigationController(rootViewController: home)
        
        let nav2 = UINavigationController(rootViewController: search)
        let nav3 = UINavigationController(rootViewController: bmi)
        let nav4 = UINavigationController(rootViewController: schedule)
        
        nav1.tabBarItem.image = UIImage(systemName: "house")
       

        
        nav2.tabBarItem.image = UIImage(systemName: "person")
       
       

        nav3.tabBarItem.image = UIImage(systemName: "scalemass")
        nav4.tabBarItem.image = UIImage(systemName: "calendar")
        
        nav1.title = "Home"
        nav2.title = "Search"
        nav3.title = "BMI Calculator"
        nav4.title = "Schedules"
        //changing color
        
        tabBar.tintColor = .white
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)

            
            
       
        
                
                
        setViewControllers([nav1,nav2,nav3,nav4],
                           animated: true)
        
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
