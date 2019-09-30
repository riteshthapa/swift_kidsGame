//
//  ViewController.swift
//  CS345 Project
//
//  Created by Huinker, Nicholas A on 3/26/19.
//  Copyright © 2019 Huinker, Nicholas A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        let screenSize: CGSize = UIScreen.main.bounds.size
        
        let btnEnterGame: UIButton = UIButton(frame: CGRect(x: screenSize.width / 2 - 75, y: screenSize.height / 2 - 25, width: 150, height: 50))
        btnEnterGame.backgroundColor = UIColor.yellow
        btnEnterGame.setTitleColor(UIColor.black, for: .normal)
        btnEnterGame.setTitle("Enter!", for: .normal)
        btnEnterGame.layer.cornerRadius = 25
        
        btnEnterGame.addTarget(self, action: Selector(("enterGame")), for: .touchUpInside)
        
        self.view.addSubview(btnEnterGame)
    }

    @objc func enterGame(){
        let main: MainMenu = MainMenu()
        
        present(main, animated: true, completion: {() -> Void in
        })
    }
}

