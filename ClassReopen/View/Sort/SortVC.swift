//
//  SortVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit

class SortVC: BaseViewController {
    
    
    //MARK: default function
    @IBOutlet weak var btnDefault: UIButton!
    @IBOutlet weak var btnFullName: UIButton!
    @IBOutlet weak var imgDefault: UIImageView!
    @IBOutlet weak var imgFullName: UIImageView!
    //MARK: Varibles
    //arrow.down
    var delegate: SelectReason?
    var selectedActionIs: String?
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Action
    @IBAction func btnDoneAction(_ sender: UIButton){
        self.dismiss(animated: true){
            self.delegate?.reasonIs(self.selectedActionIs ?? sortBy.DefaultUp.getOption())
        }
    }
    
    @IBAction func btnExclamationAction(_ sender: UIButton){
        let vc = MainClass.main.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        self.present(vc, animated: true) {
            
        }
    }
    
    @IBAction func btnDefaulAction(_ sender: UIButton){
        sender.isSelected.toggle()
        if sender.isSelected{//Up
            selectedActionIs = sortBy.DefaultUp.getOption()
            imgDefault.image = UIImage(systemName: "arrow.up")
            imgFullName.image = UIImage()
        }else{//Down
            selectedActionIs = sortBy.Defaultdown.getOption()
            imgDefault.image = UIImage(systemName: "arrow.down")
            imgFullName.image = UIImage()
        }
    }
    
    @IBAction func btnFullNameAction(_ sender: UIButton){
        sender.isSelected.toggle()
        if sender.isSelected{//Up
            selectedActionIs = sortBy.ZtoA.getOption()
            imgFullName.image = UIImage(systemName: "arrow.up")
            imgDefault.image = UIImage()
        }else{//Down
            selectedActionIs = sortBy.AtoZ.getOption()
            imgFullName.image = UIImage(systemName: "arrow.down")
            imgDefault.image = UIImage()
        }
    }
    
    fileprivate func configureUI() {
        if selectedActionIs == sortBy.DefaultUp.getOption(){
            imgDefault.image = UIImage(systemName: "arrow.up")
            imgFullName.image = UIImage()
            btnDefault.isSelected = true
        }else if selectedActionIs == sortBy.Defaultdown.getOption(){
            imgDefault.image = UIImage(systemName: "arrow.down")
            imgFullName.image = UIImage()
        }else if selectedActionIs == sortBy.ZtoA.getOption(){
            imgFullName.image = UIImage(systemName: "arrow.up")
            self.btnFullName.isSelected = true
            imgDefault.image = UIImage()
        }else if selectedActionIs == sortBy.AtoZ.getOption(){
            imgFullName.image = UIImage(systemName: "arrow.down")
            imgDefault.image = UIImage()
        }
    }
}
    
    



enum sortBy {
    case DefaultUp
    case Defaultdown
    case AtoZ
    case ZtoA
    
    func getOption() -> String{
        switch self {
        case .DefaultUp:
            return "DefaultUp"
        case .Defaultdown:
            return "Defaultdown"
        case .AtoZ:
            return "AtoZ"
        case .ZtoA:
            return "ZtoA"
        }
    }
}
