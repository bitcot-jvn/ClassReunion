//
//  EventVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class EventVC: BaseViewController {

    //MARK: default functio
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Events"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
        // Do any additional setup after loading the view.
    }
    
    
}

extension EventVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

