//
//  EventVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class EventVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var tblEvent: UITableView!
    
    //MARK: Variables
    var arrEvent: [EventModal] = []{
        didSet{
            self.tblEvent.reloadData()
        }
    }
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrEvent = DataHelper.shared.setDataForEvent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //self.navigationLargePreferStyle(false)
    }

    //MARK: Funtions
    fileprivate func configureUI() {
        self.setupSideMenu()
        self.navigationItem.title = "Events"
        self.showNavigationBar()
        self.navigationLargePreferStyle(true)
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
    }
    
}

extension EventVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellEvent", for: indexPath) as! CellEvent
        cell.data = self.arrEvent[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MainClass.Events.instantiateViewController(withIdentifier: ViewControllers.EventDetailsVC.getController()) as! EventDetailsVC
        vc.data = self.arrEvent[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
}

