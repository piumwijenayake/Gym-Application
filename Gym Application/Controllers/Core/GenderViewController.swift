//
//  GenderViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//
import UIKit

class GenderViewController: UIViewController {
    private var images: [UIImage] = []
    private let titles = ["Female", "Male"] // Array of titles
    private var selectedIndexPath: IndexPath?
    private let headerView = Header(title: "Let's Get To Know More", subTitle: "Give Us Your Gender")
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Set scroll direction to horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collectionView.alwaysBounceHorizontal = true // Allow horizontal scrolling
        return collectionView
    }()
    private let nextButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let imageNames = ["femaleVector", "maleVector"]
        for name in imageNames {
            if let image = UIImage(named: name) {
                images.append(image)
            } else {
                print("Image '\(name)' not found")
                // Handle the missing image case as per your requirement
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.nextButton.addTarget(self, action: #selector(circularButtonTapped), for: .touchUpInside)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        collectionView.backgroundColor = .black
        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(nextButton)
                
                // Set up the frame or constraints of the circular button view
                
           
        headerView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           
            headerView.heightAnchor.constraint(equalToConstant: 222),
                    
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 390),// Adjust the height as per your
            
            nextButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 22),
            nextButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

           
        ])
    }
    @objc private func circularButtonTapped() {
           // Handle circular button tap event
        let vc = CaptureViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)

       }
}

extension GenderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell")
        }
        
        let image = images[indexPath.row]
        let title = titles[indexPath.row] // Get the corresponding title from the array
        
        cell.configure(with: image, title: title)
        
        // Highlight the selected cell
        if indexPath == selectedIndexPath {
            cell.contentView.layer.borderWidth = 8.0
            cell.contentView.layer.borderColor = UIColor.blue.cgColor
            
        } else {
            cell.contentView.layer.borderWidth = 0.0
            cell.contentView.layer.borderColor = nil
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Update the selectedIndexPath when a cell is selected
        selectedIndexPath = indexPath
        collectionView.reloadData()
        let selectedImage = images[indexPath.row]
        if indexPath.row == 0
        {
            print("female")
        }
            else
        {
                print("male")
        }
        
            
    }
}

extension GenderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 210
        let height = collectionView.bounds.height // Set the height to match the collection view's height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}




