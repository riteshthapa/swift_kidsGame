//
//  MainMenu.swift
//  CS345 Project
//
//  Created by Huinker, Nicholas A on 3/26/19.
//  Copyright © 2019 Huinker, Nicholas A. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        
        let imgMainMenu:UIImageView = UIImageView(frame: CGRect(x: screenSize.width - screenSize.width / 20, y: 200, width:  screenSize.width / 10, height: screenSize.width / 10))
        
        let lblLaunchMatch: UILabel = UILabel()
        let lblLaunchName: UILabel = UILabel()
        let lblGoBack: UILabel = UILabel()
        
        lblLaunchMatch.text = "Match the shapes!"
        lblLaunchName.text = "Name that shape!"
        lblGoBack.text = "Go back"
        
        lblLaunchMatch.frame = CGRect(x: screenSize.width / 2 - 125, y: screenSize.height / 2 + 20, width: 250, height: 50)
        lblLaunchName.frame = CGRect(x: screenSize.width / 2 - 125, y: screenSize.height / 2 + 80, width: 250, height: 50)
        lblGoBack.frame = CGRect(x: screenSize.width / 2 - 125, y: screenSize.height / 2 + 140, width: 250, height: 50)
        
        lblLaunchMatch.backgroundColor = UIColor.lightGray
        lblLaunchName.backgroundColor = UIColor.lightGray
        lblGoBack.backgroundColor = UIColor.lightGray
        
        lblLaunchMatch.textAlignment = NSTextAlignment.center
        lblLaunchName.textAlignment = NSTextAlignment.center
        lblGoBack.textAlignment = NSTextAlignment.center
        
        lblLaunchMatch.layer.masksToBounds = true
        lblLaunchName.layer.masksToBounds = true
        lblGoBack.layer.masksToBounds = true
        
        lblLaunchMatch.layer.cornerRadius = 25
        lblLaunchName.layer.cornerRadius = 25
        lblGoBack.layer.cornerRadius = 25
        
        lblLaunchMatch.isUserInteractionEnabled = true
        lblLaunchName.isUserInteractionEnabled = true
        lblGoBack.isUserInteractionEnabled = true
        
        lblLaunchMatch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenu.handleTap(_:))))
        lblLaunchName.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenu.handleTap(_:))))
        lblGoBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenu.handleTap(_:))))
        
        self.view.addSubview(imgMainMenu)
        self.view.addSubview(lblLaunchName)
        self.view.addSubview(lblLaunchMatch)
        self.view.addSubview(lblGoBack)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        let label = recognizer.view as! UILabel
        
        if label.text == "Match the shapes!"{
            let match: MatchingGameViewController = MatchingGameViewController()
            present(match, animated: true, completion: {() -> Void in
            })
        }
        else if label.text == "Name that shape!"{
            let name: NamingGameViewController = NamingGameViewController()
            present(name, animated: true, completion: {() -> Void in
            })
        }
        else{
            self.dismiss(animated: true, completion: {() -> Void in
            })
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
