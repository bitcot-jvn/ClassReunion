//
//  ViewController.swift
//  ClassReunionApp
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit

class LogInVC: BaseViewController {

    //MARK: Iboutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
        self.btnContinue.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        self.btnContinue.setTitleColor(#colorLiteral(red: 0.4941176471, green: 0.3647058824, blue: 0.168627451, alpha: 1) , for: .normal)
        self.tfEmail.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.

    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if tfEmail.text!.isEmail{
            self.btnContinue.isUserInteractionEnabled = true
            self.btnContinue.setTitleColor(.black, for: .normal)
            self.btnContinue.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            self.btnContinue.isUserInteractionEnabled = false
            self.btnContinue.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
            self.btnContinue.setTitleColor(#colorLiteral(red: 0.4941176471, green: 0.3647058824, blue: 0.168627451, alpha: 1) , for: .normal)
        }
    }

    @IBAction func btnContinueAction(_ sender: UIButton){
        let vc = MainClass.main.instantiateViewController(withIdentifier: ViewControllers.EnterPinVC.getController()) as! EnterPinVC
        vc.email = self.tfEmail.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

