//
//  ModeViewController.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-18.
//

import UIKit

class ModeViewController: UIViewController {

    private let headerView = Header(title: "Let's Get To Know More", subTitle: "")
    private let ageLabel = LabelView(title: "Tell Me More About it:")
    private let mode = LabelView(title: "What Tyoe of Mode?")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let modeText: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 10, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Mode"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        // textField.delegate = self
        return textField
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
