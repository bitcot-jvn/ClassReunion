//
//  EventDetailsVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class EventDetailsVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDiscription: UILabel!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblRsvpCount: UILabel!
    
    
    var data: EventModal?{
        didSet{
            DispatchQueue.main.async { [self] in
                self.setData(data ?? EventModal())
            }
           
        }
    }
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = data?.eventTitle
        self.navigationLargePreferStyle(false)
        self.showNavigationBar()
    }
    
    //MARK: Actions
    @IBAction func btnSocialAction(_ sender: UIButton){
        switch sender.tag{
        case 0://fb
            self.openUrl(URL(string: "https://www.facebook.com/devBitcot")!)
            break
        case 1://twitter
            self.openUrl(URL(string: "https://twitter.com/")!)
            break
        case 2://insta
            self.openUrl(URL(string: "https://www.instagram.com/")!)
            break
        case 3://RsvPed
            break
        default:
            break
        }
    }
    
    @IBAction func btnRsvPedItems(_ sender: UIButton){
        let vc = MainClass.Events.instantiateViewController(withIdentifier: ViewControllers.RSVPedVC.getController()) as! RSVPedVC
        vc.arrrsvp = self.data?.Rsvp ?? []
        vc.eventName = self.data?.eventTitle
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: function
    
    func setData(_ data: EventModal){
        self.lblEventTitle.text = data.eventTitle
        self.lblEventDiscription.text = data.eventDiscription
        self.imgEvent.image = data.imgEvent
        self.lblRsvpCount.text = "\(data.Rsvp?.count ?? 0) items"
    }
    
}
