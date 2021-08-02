//
//  MainTabBarController.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = true
        self.tabBar.alpha = 0.9
        self.tabBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

   
}
