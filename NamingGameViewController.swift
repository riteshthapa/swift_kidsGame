//
//  NamingGameViewController.swift
//  CS345 Project
//
//  Created by Huinker, Nicholas A on 3/26/19.
//  Copyright © 2019 Huinker, Nicholas A. All rights reserved.
//

import UIKit

class NamingGameViewController: UIViewController {

    private let selectedImage: UIImageView? = nil
    private var selectedValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGSize = UIScreen.main.bounds.size
        // Do any additional setup after loading the view.
        var images: [UIImageView] = [UIImageView()]
        
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        images.append(UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50)))
        
        images[0].image = UIImage(named: "circle")
        images[1].image = UIImage(named: "square")
        images[2].image = UIImage(named: "rectangle")
        images[3].image = UIImage(named: "triangle")
        images[4].image = UIImage(named: "pentagon")
        images[5].image = UIImage(named: "star")
        
        
        let txtName = UITextField()
        txtName.frame = CGRect(x:screenSize.width / 2 - 135, y: screenSize.height - 200, width: 270, height: 50)
        txtName.textColor = UIColor.black
        txtName.font = UIFont.systemFont(ofSize: 24.0)
        txtName.placeholder = "Name that shape!!"
        txtName.backgroundColor = UIColor.lightGray
        txtName.backgroundColor = UIColor.lightGray
        txtName.borderStyle = UITextField.BorderStyle.bezel
        txtName.keyboardType = UIKeyboardType.default
        txtName.returnKeyType = UIReturnKeyType.done
        txtName.clearButtonMode = UITextField.ViewMode.always
        txtName.delegate = (self as! UITextFieldDelegate)
        self.view.addSubview(txtName)

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(txtName)
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
