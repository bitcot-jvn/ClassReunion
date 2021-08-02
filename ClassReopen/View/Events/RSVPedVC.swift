//
//  RSVPedVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class RSVPedVC: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tblRSVP: UITableView!
    
    //MARK: Varibles
    var arrrsvp = [RsvpModal]()
    var eventName: String?
    //MARK: default function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    fileprivate func configureUI() {
        self.sortAction()
        self.navigationItem.title = "RSVPed"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        
    }
    
    
}

//MARK:  UITableViewDelegate, UITableViewDataSource
extension RSVPedVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrrsvp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRSVP", for: indexPath) as! CellRSVP
        cell.data = self.arrrsvp[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MainClass.Events.instantiateViewController(withIdentifier: ViewControllers.RSVPedPreviewVC.getController()) as! RSVPedPreviewVC
        vc.data = self.arrrsvp[indexPath.row]
        vc.handler = { value in
            self.arrrsvp[indexPath.row].rsponse = value
            DispatchQueue.main.async {
                self.tblRSVP.reloadData()
            }
        }
        vc.eventName = self.eventName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

