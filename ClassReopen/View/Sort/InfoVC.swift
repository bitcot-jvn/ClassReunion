//
//  InfoVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit

class InfoVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var vwInfo: UIStackView!
    @IBOutlet weak var vwQrCode: UIView!
    @IBOutlet weak var imgQr: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwQrCode.isHidden = true
        self.imgQr.image = self.generateQRCode(from: baseUrl.app)
        // Do any additional setup after loading the view.
    }
    
    //MARK: Action
     @IBAction func btnDoneAction(_ sender: UIButton){
         self.dismiss(animated: true) {
             
         }
     }
     
     @IBAction func btnQRAction(_ sender: UIButton){
        sender.isSelected.toggle()
        if sender.isSelected{
            self.setView(view: self.vwInfo, hidden: true)
            self.setView(view: self.vwQrCode, hidden: false)
        }else{
            self.setView(view: self.vwInfo, hidden: false)
            self.setView(view: self.vwQrCode, hidden: true)
        }
     }
    
    @IBAction func btnOptionsActions(_ sender: UIButton){
        switch  sender.tag {
        case 0:
            break
        case 1:
            let vc = MainClass.main.instantiateViewController(withIdentifier: ViewControllers.SendFeedbackVC.getController()) as! SendFeedbackVC
            self.present(vc, animated: false, completion: nil)
            break
        case 2:
            let vc = MainClass.main.instantiateViewController(withIdentifier: ViewControllers.ReportThisAppVC.getController()) as! ReportThisAppVC
            self.present(vc, animated: false, completion: nil)
            break
        default:
            break
        }
    }
    

}
