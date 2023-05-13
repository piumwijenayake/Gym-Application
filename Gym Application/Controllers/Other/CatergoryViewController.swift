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
    let images = ["catergory0","catergory1","catergory2","catergory3","catergory4"]
    let viewControllers = ["cardio", "strength", "yoga","data"] // Add your view controller classes or identifiers here

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
       
        
           
           // Set Auto Layout constraints f NSLayoutConstraint.activate([
        titleName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
                        
                        // Constraints for titleSub
        titleSub.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 10).isActive = true
        titleSub.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleSub.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -170).isActive = true
                        
                        // Constraints for collectionView
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        collectionView.topAnchor.constraint(equalTo: titleSub.bottomAnchor, constant: 30).isActive=true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
             
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 420/2 - 20, height: 290)

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath ) {
        let selectedText = viewControllers[indexPath.item]
        print(selectedText) // Displcontroller
                
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
        catergoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        catergoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        catergoryImageView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        catergoryImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
            
         
     
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
