//
//  MemoriesDetailVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class MemoriesDetailVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblEmailTitle: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    @IBOutlet weak var lblPassout: UILabel!
    @IBOutlet weak var vwHeader: UIView!
    
    //MARK: Variables
    var data: classMateModal?{
        didSet{
            DispatchQueue.main.async {
                self.lblEmail.text = self.data?.email
                self.lblEmailTitle.text = self.data?.email
                self.lblName.text = self.data?.name
                self.imgProfile.image = self.data?.profileImage
                self.lblTitle.text = self.data?.MemorieTitle
                self.lblDiscription.text = self.data?.MemorieDiscription
                self.lblPassout.text = self.data?.MemorieDate
                
            }
        }
    }
    //MARK: default function
    override func viewDidLoad() {
        super.viewDidLoad()
        if data?.id == "111-111-111"{
            self.vwHeader.isHidden = true
        }else{
            self.vwHeader.isHidden = false
        }
        
        self.navigationItem.title = data?.MemorieTitle
        self.navigationLargePreferStyle(false)
        self.showNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDetailAction(_ sender: UIButton){
        let vc = MainClass.Classmates.instantiateViewController(withIdentifier: ViewControllers.ClassMateDetailVC.getController()) as! ClassMateDetailVC
        vc.data = self.data
        self.navigationController?.pushViewController(vc, animated: false)
    }

    @IBAction func btnEmailAction(_ sender: UIButton){
        self.openServices(urlStr: "mailto:", data: (data?.email)!)
    }
}
