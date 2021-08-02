//
//  SideMenuVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit
import SDWebImage

class SideMenuVC: BaseViewController {
    //MARK: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    //MARK: variables
    var arrOptions = [MenuOptions]()
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
        self.lblEmail.text = SharedPreference.getUserData().email
        self.lblName.text = SharedPreference.getUserData().name
        self.imgProfile.sd_setImage(with: SharedPreference.getUserData().profileImg, placeholderImage: #imageLiteral(resourceName: "user"), options: .scaleDownLargeImages, completed: nil)
        self.arrOptions = [MenuOptions("BitCot - App Development Company", UIImage(systemName: "desktopcomputer")!), MenuOptions("Privacy", UIImage(systemName: "lock.fill")!), MenuOptions("About", UIImage(systemName: "exclamationmark.bubble.fill")!), MenuOptions("Sign Out", #imageLiteral(resourceName: "icons8-exit"))]
        // Do any additional setup after loading the view.
    }
    
}

//MARK:UITableViewDataSource, UITableViewDelegate
extension SideMenuVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSideMenu",for: indexPath) as! CellSideMenu
        cell.lblName.text = self.arrOptions[indexPath.row].name
        cell.imgIcon.image = self.arrOptions[indexPath.row].icon
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //dismiss(animated: true){
            self.selectedOptionSetup(indexPath.row)
       // }
      
    }
}



//MARK: MenuOptions
struct MenuOptions {
    var name: String?
    var icon: UIImage?
    
    init(_ name: String, _ icon: UIImage) {
        self.name = name
        self.icon = icon
    }
}
