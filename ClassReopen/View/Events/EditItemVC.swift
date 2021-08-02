//
//  EditItemVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class EditItemVC: BaseViewController {

    //MARK:Outlets
    @IBOutlet weak var lblEventname: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    
    //MARK: Variables
    var eventName:String?
    var delegate: SelectReason?
    var data: RsvpModal?
    
    
    //MARK: Default Funtion
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        DispatchQueue.main.async {
            self.lblEmail.text = self.data?.email
            self.lblEventname.text = self.eventName
            self.setDefaultAction()
        }
    }
    

    //MARK: Actions
    @IBAction func doneBarAction(_ sender: UIButton){
        self.dismiss(animated: true){ [self] in
            self.delegate?.reasonIs((data?.rsponse)!)
        }
    }
    
    @IBAction func cancelBarAction(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segamentAction(sender: Any){
        switch self.segment.selectedSegmentIndex {
        case 0:
            self.congigureBtnAttending()
        case 1:
            self.configureBtnNotAttending()
        case 2:
            self.configureBtnMayBe()
        default:
            break
        }
    }
   
    func congigureBtnAttending(){
        data?.rsponse = reasonRsvp.Attending.getRaason()
    }
    
    func configureBtnNotAttending(){
        data?.rsponse = reasonRsvp.NotAttending.getRaason()
    }
    
    func configureBtnMayBe(){
        data?.rsponse = reasonRsvp.MayBe.getRaason()
    }
    
    func setDefaultAction(){
        if data?.rsponse == reasonRsvp.Attending.getRaason(){
            segment.selectedSegmentIndex = 0
        }else  if data?.rsponse == reasonRsvp.NotAttending.getRaason(){
            segment.selectedSegmentIndex = 1
        }else  if data?.rsponse == reasonRsvp.MayBe.getRaason(){
            segment.selectedSegmentIndex = 2
        }
    }

}
