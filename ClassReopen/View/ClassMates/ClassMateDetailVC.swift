//
//  ClassMateDetailVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit
import Messages
import MessageUI


class ClassMateDetailVC: BaseViewController {
    //MARk: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    	
    
    //MARK: Variables
    var data: classMateModal?
    
    
    //MARK: Default Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
  
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationLargePreferStyle(true)
    }
    
    //MARK: Actions
    @IBAction func btnCallAction(_ sender: UIButton){
        self.openServices(urlStr: "tel://", data: data?.mobile ?? "")
    }
    
    @IBAction func btnMessageAction(_ sender: UIButton){
        self.openServices(urlStr: "sms://", data: data?.mobile ?? "")
    }
    
    @IBAction func btnMailAction(_ sender: UIButton){
        self.openServices(urlStr: "mailto:", data: data?.mobile ?? "")
    }
    
    //MARK: Function
    func setData(){
        self.lblName?.text = data?.name
        self.lblDob?.text = data?.DOB
        self.lblEmail?.text = data?.email
        self.lblNumber?.text = data?.mobile
        self.imgProfile?.image = data?.profileImage
        self.lblAddress?.text = data?.address
    }
    
    
    fileprivate func configureUI() {
        self.navigationItem.title = data?.name
        self.navigationLargePreferStyle(false)
        self.showNavigationBar()
    }
}


extension ClassMateDetailVC{
   
}
