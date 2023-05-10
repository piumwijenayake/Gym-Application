//
//  CatergoryViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-10.
//

import UIKit

class CatergoryViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    private let titleName: UILabel={
        let titleName = UILabel()
        titleName.center = CGPoint(x: 120, y: 194)
        titleName.textAlignment = .center
        titleName.text = "Catergory"
        titleName.font = UIFont.boldSystemFont(ofSize: 30)
        titleName.textColor = .white
        titleName.translatesAutoresizingMaskIntoConstraints = false
        
        return titleName
        
            
            
        
    }()
    private let titleSub: UILabel={
        let titleSub = UILabel()
        titleSub.center = CGPoint(x: 120, y: 194)
        titleSub.textAlignment = .center
        titleSub.text = "Browse your catergory"
        titleSub.font = UIFont.boldSystemFont(ofSize: 20)
        titleSub.textColor = .white
        titleSub.translatesAutoresizingMaskIntoConstraints = false
        
        return titleSub
        
            
            
        
    }()
    let images = ["catergory1","catergory2"]
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           let layout = UICollectionViewFlowLayout()
         collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

          collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        
        view.addSubview(titleName)
        view.addSubview(titleSub)
        view.addSubview(collectionView)
       
        
           
           // Set Auto Layout constraints for the logoName label
           NSLayoutConstraint.activate([
            titleName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                        titleName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230),
                        
                        // Constraints for titleSub
           titleSub.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 10),
        titleSub.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        titleSub.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -170),
                        
                        // Constraints for collectionView
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.topAnchor.constraint(equalTo: titleSub.bottomAnchor, constant: 30),
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
             
               
            
           ])
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")

           // Do any additional setup after loading the view.
       }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.catergoryImageView.image = UIImage(named: images[indexPath.row])
        return cell
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
class CustomCell : UICollectionViewCell {
    let catergoryImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(catergoryImageView)
        catergoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
  
            
             catergoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             catergoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
             catergoryImageView.topAnchor.constraint(equalTo: topAnchor),
             catergoryImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
         
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
