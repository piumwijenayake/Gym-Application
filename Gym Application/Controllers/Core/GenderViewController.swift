//
//  GenderViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//

import UIKit

class GenderViewController: UIViewController {

    private let headerView = AuthView(title: "Lets Get to know more about you", subTitle: "Tell Us Your Gender")
    private var imageTilesView: ImageTilesView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTilesView = ImageTilesView()
        self.setupUI()

        // Do any additional setup after loading the view.
    }
    private func setupUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(imageTilesView)
        self.imageTilesView.translatesAutoresizingMaskIntoConstraints = false
        
        
             // Add constraints for ImageTilesView
             NSLayoutConstraint.activate([
                 imageTilesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                 imageTilesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                 imageTilesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                 imageTilesView.heightAnchor.constraint(equalToConstant: 100)
             ])
             
             // Add image tiles to ImageTilesView
             let image1 = UIImage(named: "image1")
             let image2 = UIImage(named: "image2")
             
        self.imageTilesView.addImageTile(image: image1)
        self.imageTilesView.addImageTile(image: image2)
             
             // Set the didSelectImage closure to handle tap events
             imageTilesView.didSelectImage = { selectedImage in
                 // Handle the selected image
                 print("Selected image: \(selectedImage)")
             }
        
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
