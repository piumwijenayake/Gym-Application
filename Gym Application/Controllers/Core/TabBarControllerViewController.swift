//
//  TabBarControllerViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-09.
//

import UIKit

class TabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setUpTabs()
        // Do any additional setup after loading the view.
    }
    private func setUpTabs(){
        let home = HomeViewController()
        let search = SearchViewController()
        let bmi = BMIViewController()
        
        
        let nav1 = UINavigationController(rootViewController: home)
        
        let nav2 = UINavigationController(rootViewController: search)
        let nav3 = UINavigationController(rootViewController: bmi)
        
        nav1.tabBarItem.image = UIImage(systemName: "house")
       

        
        nav2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
       
       

        nav3.tabBarItem.image = UIImage(systemName: "scalemass")
        
        nav1.title = "Home"
        nav2.title = "Search"
        nav3.title = "BMI Calculator"
        
        tabBar.tintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)

            
            
       
        
                
                
        setViewControllers([nav1,nav2,nav3],
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
