//
//  RSVPedPreviewVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class RSVPedPreviewVC: BaseViewController {

    
    //MARK: IBOutlet
    @IBOutlet weak var lblResponse: UILabel!
    
    //MARK: Variables
    typealias complitionHandler = (String) -> Void
    
    var handler: complitionHandler?
    var eventName: String?
    var data: RsvpModal?{
        didSet{
            DispatchQueue.main.async {
                self.lblResponse.text = self.data?.rsponse
            }
        }
    }
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = eventName
        self.navigationLargePreferStyle(false)
        self.editRSVPed()
    }
    
    //MARK: functions
    func editRSVPed(){
        let right = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(EditBarAction))
        self.navigationItem.rightBarButtonItem = right
    }

    @objc func EditBarAction(){
        let vc = MainClass.Events.instantiateViewController(withIdentifier: ViewControllers.EditItemVC.getController()) as! EditItemVC
        vc.isModalInPresentation = true
        vc.delegate = self
        vc.eventName = self.eventName
        vc.data = self.data
        self.present(vc, animated: true, completion: nil)
    }

}


extension RSVPedPreviewVC: SelectReason{//delegate
    func reasonIs(_ name: String) {
        self.data?.rsponse = name
        self.handler!(name)
    }
}
    

