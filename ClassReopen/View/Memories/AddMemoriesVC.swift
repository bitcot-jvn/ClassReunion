//
//  AddMemoriesVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import UIKit

class AddMemoriesVC: BaseViewController {
    
    typealias handler = (_ dic:[String:String]) -> Void
    
    //MARK: Outlets
    @IBOutlet weak var vwUnderLine1: UIView!
    @IBOutlet weak var vwUnderLine2: UIView!
    @IBOutlet weak var tfTitle: KTextField!
    @IBOutlet weak var tfPassout: KTextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    
    //MARK: Variables
    var complitionHandler: handler?
    var data = [classMateModal]()
    var myId = "111-111-111"
    
    //MARK: Default Funtion
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfTitle.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.tfPassout.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    //MARK: Actions
    @IBAction func btnCancelAction(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @IBAction func btnAddAction(_ sender: UIButton){
        var dic = [String:String]()
        dic["MemorieTitle"] = self.tfTitle.text; dic["MemorieDiscription"] = self.lblDiscription.text ; dic["MemorieDate"] = self.tfPassout.text
        dic["id"] = myId
        self.dismiss(animated: true){ [self] in
            self.complitionHandler!(dic)
        }
    }
    
    @IBAction func btnAddDiscription(_ sender: UIButton){
        view.endEditing(true)
        let vc = MainClass.Memories.instantiateViewController(withIdentifier: ViewControllers.DiscriptionVC.getController()) as! DiscriptionVC
        vc.delegate = self
        vc.text = self.lblDiscription.text
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

//MARK: TextFild delgate
extension AddMemoriesVC: SelectReason{
    
    func reasonIs(_ name: String) {
        self.lblDiscription.text = name
        self.validate()
    }
    
    func validate(){
        if tfTitle.text != "" && self.tfPassout.text != "" && self.lblDiscription.text != ""{
            self.btnAdd.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            self.btnAdd.isUserInteractionEnabled = true
        }else{
            self.btnAdd.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
            self.btnAdd.isUserInteractionEnabled = false
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.validate()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfTitle{
            self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: false, color: #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), tfPlaceHolder: "", lbl: lbl1, view: self.vwUnderLine1, txtFild:    tfTitle)
        }else if textField == tfPassout{
            self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: false, color: #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), tfPlaceHolder: "", lbl: lbl2, view: self.vwUnderLine2, txtFild:    tfPassout)
        }
    }
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == tfTitle{
            if textField.text != ""{
                self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: false, color: #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), tfPlaceHolder: "", lbl: lbl1, view: self.vwUnderLine1, txtFild:    tfTitle)
            }else{
                self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: true, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), tfPlaceHolder: "Title", lbl: lbl1, view: self.vwUnderLine1, txtFild:    tfTitle)
            }
        }else if textField == tfPassout{
            if textField.text != ""{
                self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: false, color: #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), tfPlaceHolder: "", lbl: lbl2, view: self.vwUnderLine2, txtFild:    tfPassout)
            }else{
                self.setTextfildAnimation(lblTitle: "", lblTitleHideShow: true, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), tfPlaceHolder: "Passed out", lbl: lbl2, view: self.vwUnderLine2, txtFild: tfPassout)
            }
        }
    }
    
    func setTextfildAnimation(lblTitle: String, lblTitleHideShow: Bool, color: UIColor, tfPlaceHolder: String, lbl:UILabel, view: UIView, txtFild: UITextField){
        txtFild.placeholder = tfPlaceHolder
        lbl.textColor = color
        self.setView(view: lbl, hidden: lblTitleHideShow)
        view.backgroundColor = color
    }
}
