//
//  LabelView.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-14.
//

import UIKit

class LabelView: UIView {
    private let txtlabel: UILabel = {
        let txtlabel = UILabel()
        txtlabel.textColor = .label
        txtlabel.textAlignment = .center
        txtlabel.font = .systemFont(ofSize: 16, weight: .regular)
        txtlabel.text = "Title"
        txtlabel.textColor = .white
        return txtlabel
    }()
    init(title:String){
        super.init(frame: .zero)
        self.txtlabel.text = title
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
          self.addSubview(txtlabel)
          

          txtlabel.translatesAutoresizingMaskIntoConstraints = false
          

          NSLayoutConstraint.activate([
              self.txtlabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
              self.txtlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
              self.txtlabel.widthAnchor.constraint(equalToConstant: 190),
              self.txtlabel.heightAnchor.constraint(equalToConstant: 90),

              ])
      }
    
    
}
