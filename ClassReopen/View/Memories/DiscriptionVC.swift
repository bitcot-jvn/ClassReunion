//
//  DiscriptionVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import UIKit

class DiscriptionVC: UIViewController {

    @IBOutlet weak var tvDiscription: UITextView!
    
    var delegate: SelectReason?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tvDiscription.text = self.text
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCanselAction(_ sender: UIButton){
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func btnDoneAction(_ sender: UIButton){
        self.dismiss(animated: true) {
            self.delegate?.reasonIs(self.tvDiscription.text)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
