//
//  SendFeedbackVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit

class SendFeedbackVC: BaseViewController, UITextViewDelegate {
    
    //MARK: outlets
    @IBOutlet weak var vwUnderLine: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var lblPlaceHolde: UILabel!
    @IBOutlet weak var btnsend: UIButton!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblMessage.isHidden = true
        self.tvMessage.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnBackAction(_ sender: UIButton){
        self.dismiss(animated: false) {
            
        }
    }
    
    @IBAction func btnSendAction(_ sender: UIButton){
        self.dismiss(animated: false)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       // self.lblPlaceHolde.isHidden = true
        self.setView(view: lblPlaceHolde, hidden: true)
        self.setView(view: lblMessage, hidden: false)
        self.lblMessage.textColor = #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1)
        self.vwUnderLine.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1)
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            self.setTextView(lblMessageHide: true, btnSendUserIntrection: false, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), btnSendTitleColor: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == ""{
            self.btnsend.isUserInteractionEnabled = false
            self.btnsend.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        }else{
            self.setTextView(lblMessageHide: false, btnSendUserIntrection: true, color: #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), btnSendTitleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        if newSize.height > 40{
            tvHeight.constant = newSize.height
        }else{
            tvHeight.constant = 40.0
        }
    }
    
    func setTextView(lblMessageHide: Bool, btnSendUserIntrection: Bool, color: UIColor, btnSendTitleColor: UIColor){
        self.setView(view: lblMessage, hidden: lblMessageHide)
        self.btnsend.isUserInteractionEnabled = btnSendUserIntrection
        self.btnsend.setTitleColor(btnSendTitleColor, for: .normal)
        self.vwUnderLine.backgroundColor = color
        //self.lblPlaceHolde.isHidden = btnSendUserIntrection
        self.setView(view: lblPlaceHolde, hidden: btnSendUserIntrection)
        self.lblMessage.textColor = color
    }
}
    

