//
//  GalleryVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class GalleryVC: BaseViewController {

    @IBOutlet weak var tblGallery: UITableView!
    
    //MARK: Variables
    var arrGallery: [GalleryModal] = []{
        didSet{
            DispatchQueue.main.async {
                self.tblGallery.reloadData()
            }
        }
    }
    
    //MARK: default functio
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrGallery = DataHelper.shared.setDataForGallery
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    //MARK: Funtion
    fileprivate func configureUI() {
       
        self.setupSideMenu()
        self.navigationItem.title = "Gallery"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
    }
    
    
}

extension GalleryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellEvent", for: indexPath) as! CellEvent
        cell.imgEvent.image = self.arrGallery[indexPath.row].imgEvent?[0]
        cell.lblEventTitle.text = self.arrGallery[indexPath.row].eventTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MainClass.Home.instantiateViewController(withIdentifier: ViewControllers.GalleryDetailsVC.getController()) as! GalleryDetailsVC
        vc.data =  self.arrGallery[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
