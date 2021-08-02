//
//  MemoriesVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class MemoriesVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Memories"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.addMemories()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
        // Do any additional setup after loading the view.
    }
    
}


extension MemoriesVC: UITableViewDelegate, UITableViewDataSource{
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
