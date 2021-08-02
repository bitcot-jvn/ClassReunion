//
//  ChatVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class ChatVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
        self.navigationItem.title = "Chat"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
        // Do any additional setup after loading the view.
    }

}
