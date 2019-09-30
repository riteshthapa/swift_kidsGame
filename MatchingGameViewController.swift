//
//  MatchingGameViewController.swift
//  CS345 Project
//
//  Created by Thapa, Ritesh R on 4/07/19.
//  Copyright © 2019 Thapa, Ritesh R. All rights reserved.
//

import UIKit

class MatchingGameViewController: UIViewController {
    
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var images: [UIImageView] = []
    
    let image0 = UIImageView()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let image4 = UIImageView()
    let image5 = UIImageView()
    
    var correctImg: UIImageView = UIImageView()
    
    var textFields : [UITextField] = []
    
    let textField0 = UITextField()
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    let textField5 = UITextField()
    
    
    
    private let startLabel = UILabel() // UILabel
    
    // control button
    let nextBtn = UIButton(type: UIButton.ButtonType.custom)
    let goBackBtn = UIButton(type: UIButton.ButtonType.custom)
    
    // result button
    let resultBtn = UIButton(type: UIButton.ButtonType.custom)
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        backgroundImage.image = UIImage(named: "colorWheel.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        self.backgroundImage.isHidden = true
        
        let centerX: CGFloat = screenSize.width / 2
//        let centerY: CGFloat = screenSize.height / 2
        
        images.append(image0)
        images.append(image1)
        images.append(image2)
        images.append(image3)
        images.append(image4)
        images.append(image5)
        
        images[0].image = UIImage(named: "circle.png")
        
        images[1].image = UIImage(named: "square.png")
        
        
        correctImg = UIImageView(image: UIImage(named: "greatJob.jpg"))
//        correctImg.frame = CGRect(x: 110, y: 200, width: 230, height: 230)
//        correctImg.isHidden = true
//        self.view.addSubview(correctImg)
        
        textFields.append(textField0)
        textFields.append(textField1)
        textFields.append(textField2)
        textFields.append(textField3)
        textFields.append(textField4)
        textFields.append(textField5)
        
        textFields[0].isHidden = true
        textFields[1].isHidden = true
        
        //        for n in 0...5{
////            textFields[n].frame = CGRect(x:screenSize.width / 2 - 90, y: screenSize.height - 490, width: 186, height: 30)
//            textFields[n].textColor = UIColor.black
//            textFields[n].font = UIFont.systemFont(ofSize: 19.0)
//            textFields[n].placeholder = "enter color name"
//            textFields[n].backgroundColor = UIColor.white
//            textFields[n].borderStyle = UITextField.BorderStyle.roundedRect
//            textFields[n].keyboardType = UIKeyboardType.default
//            textFields[n].returnKeyType = UIReturnKeyType.done
//            textFields[n].clearButtonMode = UITextField.ViewMode.always
//            textFields[n].autocorrectionType = UITextAutocorrectionType.no
//            textFields[n].delegate = self as? UITextFieldDelegate
//            self.view.backgroundColor = UIColor.white
//            textFields[n].isHidden = true
//        }
        // this the label, we will be using to start the game - for identifying the color of the shapes
        startLabel.text = "Tap to start the game"
        startLabel.backgroundColor = UIColor.white
        startLabel.textColor = UIColor.black
        startLabel.font = UIFont.systemFont(ofSize: 18.0)
        startLabel.textAlignment = NSTextAlignment.center
        startLabel.frame = CGRect(x: centerX-125, y: 100, width: 250, height: 50)
        startLabel.isUserInteractionEnabled = true
        startLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MatchingGameViewController.handleTap(_:))))
        self.view.addSubview(startLabel)
        
        // contoller = next level button
        nextBtn.frame = CGRect(x: centerX+120, y: UIScreen.main.bounds.size.height-74, width: 55, height: 55)
        nextBtn.setImage(UIImage(named: "next.png"), for: UIControl.State.normal)
        nextBtn.isUserInteractionEnabled = true
        nextBtn.addTarget(self, action: #selector(MatchingGameViewController.handleTap(_:)), for: UIControl.Event.touchUpInside)
        nextBtn.isHidden = true
        self.view.addSubview(nextBtn)
        
        // controller = go back button
        goBackBtn.frame = CGRect(x: centerX-180, y: UIScreen.main.bounds.size.height-74, width: 55, height: 55)
        goBackBtn.setImage(UIImage(named: "goBack.png"), for: UIControl.State.normal)
        goBackBtn.addTarget(self, action: #selector(MatchingGameViewController.goBack(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(goBackBtn)
        
        // result button
        resultBtn.frame = CGRect(x:screenSize.width / 2 - 90, y: screenSize.height - 100, width: 55, height: 55)
        resultBtn.setImage(UIImage(named: "result.png"), for: UIControl.State.normal)
//        resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateColor(_:)), for: UIControl.Event.touchUpInside)
        resultBtn.isHidden = true
        self.view.addSubview(resultBtn)
        
        // Setup to process keyboard notifications
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(MatchingGameViewController.keyboardWillShow(notification:)), name: UITextField.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(MatchingGameViewController.keyboardWillHide(notification:)), name: UITextField.keyboardWillHideNotification, object: nil)
         self.view.backgroundColor = UIColor.lightGray
        
    }
    
    @objc func goBack(_ recognizer: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Main Menu", message: "" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                print("if yes - end game then switch the view contoller to main menu")
                let vc = MainMenu()
                self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // tap here to start the game
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        startLabel.isHidden = true// hide the label when the game starts
        nextBtn.isHidden = false
        resultBtn.isHidden = false
        backgroundImage.isHidden = false
        
        correctImg.removeFromSuperview()
        
        images[0].removeFromSuperview()
        images[1].removeFromSuperview()

        textFields[0].removeFromSuperview()
        textFields[1].removeFromSuperview()

    
        let randomNumber: Int = Int (arc4random_uniform(2))
        print(randomNumber)
        
        if randomNumber == 0 {
            images[0].frame = CGRect(x: 110, y: 200, width: 200, height: 200)
            self.view.addSubview(images[0])
            self.view.backgroundColor = UIColor.orange
            
            self.textFields[0].frame = CGRect(x:screenSize.width / 2 - 90, y: screenSize.height - 490, width: 186, height: 30)
            textFields[0].placeholder = "enter orange color name"
            textFields[0].backgroundColor = UIColor.white
            textFields[0].borderStyle = UITextField.BorderStyle.roundedRect
            textFields[0].keyboardType = UIKeyboardType.default
            textFields[0].returnKeyType = UIReturnKeyType.done
            textFields[0].clearButtonMode = UITextField.ViewMode.always
            textFields[0].autocorrectionType = UITextAutocorrectionType.no
            textFields[0].delegate = self as? UITextFieldDelegate
            self.view.backgroundColor = UIColor.white
//            textFields[0].isHidden = true

            self.textFields[0].text = ""
            self.textFields[0].isHidden = false
            self.view.addSubview(textFields[0])
            
            self.resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateOrange(_:)), for: UIControl.Event.touchUpInside)
        } else if randomNumber == 1 {
            images[1].frame = CGRect(x: 110, y: 300, width: 200, height: 200)
            self.view.addSubview(images[1])
            self.view.backgroundColor = UIColor.green
            
            self.textFields[1].frame = CGRect(x:screenSize.width / 2 - 90, y: screenSize.height - 390, width: 186, height: 30)
            textFields[1].placeholder = "enter green color name"
            textFields[1].backgroundColor = UIColor.white
            textFields[1].borderStyle = UITextField.BorderStyle.roundedRect
            textFields[1].keyboardType = UIKeyboardType.default
            textFields[1].returnKeyType = UIReturnKeyType.done
            textFields[1].clearButtonMode = UITextField.ViewMode.always
            textFields[1].autocorrectionType = UITextAutocorrectionType.no
            textFields[1].delegate = self as? UITextFieldDelegate
            self.view.backgroundColor = UIColor.white
//            textFields[1].isHidden = true

            self.textFields[1].text = ""
            self.textFields[1].isHidden = false
            self.view.addSubview(textFields[1])
            
            resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateGreen(_:)), for: UIControl.Event.touchUpInside)
        } else if randomNumber == 2 {
            textFields[2].text = ""
            textFields[2].isHidden = false
            let imageName = "pentagon.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 110, y: 200, width: 200, height: 200)
            self.view.addSubview(imageView)
            self.view.bringSubviewToFront(imageView)
            resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validatePurple(_:)), for: UIControl.Event.touchUpInside)
        } else if randomNumber == 3 {
            textFields[3].text = ""
            textFields[3].isHidden = false
            let imageName = "star.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 110, y: 200, width: 200, height: 200)
            self.view.addSubview(imageView)
            self.view.bringSubviewToFront(imageView)
            resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateBlue(_:)), for: UIControl.Event.touchUpInside)
        } else if randomNumber == 4 {
            textFields[4].text = ""
            textFields[4].isHidden = false
            let imageName = "rectangle.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 110, y: 200, width: 200, height: 200)
            self.view.addSubview(imageView)
            self.view.bringSubviewToFront(imageView)
            resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateRed(_:)), for: UIControl.Event.touchUpInside)
        }else if randomNumber == 5 {
            textFields[5].text = ""
            textFields[5].isHidden = false
            let imageName = "triangle.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 110, y: 200, width: 200, height: 200)
            self.view.addSubview(imageView)
            self.view.bringSubviewToFront(imageView)
            resultBtn.addTarget(self, action: #selector(MatchingGameViewController.validateYellow(_:)), for: UIControl.Event.touchUpInside)
        }
    }
  
    //circle = orange color 0
    @objc func validateOrange(_ recognizer: UITapGestureRecognizer) {
        if (textFields[0].text == "") {
            print("orange - nothing entered")
            
//            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "Ok", style: .default)
//            {(action) in
//
//            }
//            alertController.addAction(defaultAction)
//            present(alertController, animated: true, completion: nil)
        }else{
        
//        else if (textFields[0].text != nil){
//            print("something is entered")
          if  (textFields[0].text == "Orange") || (textFields[0].text == "orange"){
                print("orange is entered, correct entry.")
//                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .default)
//                {(action) in
//
//                }
//                alertController.addAction(defaultAction)
//                present(alertController, animated: true, completion: nil)
            
            correctImg.frame = CGRect(x: 110, y: 200, width: 230, height: 230)
            
            self.correctImg.isHidden = false
            self.view.addSubview(correctImg)
            }else {
                print("wrong color entered.")
//                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .default)
//                {(action) in
//
//                }
//                alertController.addAction(defaultAction)
//                present(alertController, animated: true, completion: nil)
        }
        }
    }

    
    //sqaure = green 1
    @objc func validateGreen(_ recognizer: UITapGestureRecognizer) {
        if (textFields[1].text == "") {
            print("green - nothing entered")
//            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "Ok", style: .default)
//            {(action) in
//
//            }
//            alertController.addAction(defaultAction)
//            present(alertController, animated: true, completion: nil)
        }

//        else if (textFields[1].text != nil){
//            print("something is entered")
          else
        {
            if  (textFields[1].text == "Green") || (textFields[1].text == "green"){
                print("green is entered, correct entry.")
//                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .default)
//                {(action) in
//
//                }
//                alertController.addAction(defaultAction)
//                present(alertController, animated: true, completion: nil)
                textFields[1].removeFromSuperview()
            correctImg.frame = CGRect(x: 110, y: 200, width: 230, height: 230)
            self.correctImg.isHidden = false
            self.view.addSubview(correctImg)
            }else {
                print("wrong color entered.")
//                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .default)
//                {(action) in
//
//                }
//                alertController.addAction(defaultAction)
//                present(alertController, animated: true, completion: nil)
        }
        }
    }
    
    //pentagon = purple color 2
    @objc func validatePurple(_ recognizer: UITapGestureRecognizer) {
        if (textFields[2].text == "") {
            print("nothing entered")
            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default)
            {(action) in
                
            }
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
        else if (textFields[2].text != nil){
            print("something is entered")
            if  (textFields[2].text == "Purple") || (textFields[2].text == "purple"){
                print("purple is entered, correct entry.")
                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }else {
                print("wrong color entered.")
                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
            }
        }
        

    //star = blue color 3
    @objc func validateBlue(_ recognizer: UITapGestureRecognizer) {
        if (textFields[3].text == "") {
            print("nothing entered")
            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default)
            {(action) in
                
            }
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
        else if (textFields[3].text != nil){
            print("something is entered")
            if  (textFields[3].text == "Blue") || (textFields[3].text == "blue"){
                print("blue is entered, correct entry.")
                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }else {
                print("wrong color entered.")
                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //rectangle = red color 4
    @objc func validateRed(_ recognizer: UITapGestureRecognizer) {
        if (textFields[4].text == "") {
            print("nothing entered")
            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default)
            {(action) in
                
            }
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
        else if (textFields[4].text != nil){
            print("something is entered")
            if  (textFields[4].text == "Red") || (textFields[4].text == "red"){
                print("red is entered, correct entry.")
                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }else {
                print("wrong color entered.")
                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //triangle = yellow color 5
    @objc func validateYellow(_ recognizer: UITapGestureRecognizer) {
        if (textFields[5].text == "") {
            print("nothing entered")
            let alertController = UIAlertController(title: "No entry", message: "Enter some color name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default)
            {(action) in
                
            }
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
        else if (textFields[5].text != nil){
            print("something is entered")
            if  (textFields[5].text == "Yellow") || (textFields[5].text == "yellow"){
                print("yellow is entered, correct entry.")
                let alertController = UIAlertController(title: "Excellent", message: "You got the correct color name.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }else {
                print("wrong color entered.")
                let alertController = UIAlertController(title: "Try Again", message: "You entred the wrong color name." , preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                {(action) in
                    
                }
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    // Process the appearance of the keyboard
    @objc func keyboardWillShow(notification: Notification) {
        print("Showing keyboard...")
    }
    
    // Process the disappearance of the keyboard
    @objc func keyboardWillHide(notification: Notification) {
        print("Hiding keyboard...")
    }
}
