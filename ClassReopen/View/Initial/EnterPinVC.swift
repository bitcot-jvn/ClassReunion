//
//  EnterPinVC.swift
//  EnterPinVC
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit

class EnterPinVC: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tfPin: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    
    //MARK: Variables
    var email: String!
    
    //MARK: Default Function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func btnSignInAction(_ sender: UIButton){
        let vc = MainClass.Home.instantiateViewController(withIdentifier: ViewControllers.MainTabBarController.getController()) as! MainTabBarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnAnotherPinAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Functions
    fileprivate func configureUI() {
        self.hideNavigationBar()
        self.title = AppName.app
        self.tfPin.text = "12345"
        self.lblDescription.text = "We've sent a pin to \(self.email ?? "nil")"
        self.btnSignIn.setTitleColor(#colorLiteral(red: 0.4941176471, green: 0.3647058824, blue: 0.168627451, alpha: 1) , for: .normal)
        self.btnSignIn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        self.tfPin.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if tfPin.text?.count == 5{
            self.btnSignIn.isUserInteractionEnabled = true
            self.btnSignIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.btnSignIn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            self.btnSignIn.isUserInteractionEnabled = false
            self.btnSignIn.setTitleColor(#colorLiteral(red: 0.4941176471, green: 0.3647058824, blue: 0.168627451, alpha: 1) , for: .normal)
            self.btnSignIn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
            
        }
    }
   
}
//MARK: Delegate
extension EnterPinVC{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 5
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
}
