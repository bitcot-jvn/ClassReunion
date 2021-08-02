//
//  MemoriesVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 21/07/21.
//

import UIKit

class MemoriesVC: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tblMemories: UITableView!
    //MARK: Variables
    var arrMemories: [classMateModal] = []{
        didSet{
            DispatchQueue.main.async {
                self.tblMemories.reloadData()
            }
        }
    }
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrMemories = DataHelper.shared.setdata
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureUI()
    }
    
    //MARK: Funtions
    func addMemories(){
        let right = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addmemoriesAction))
        self.navigationItem.rightBarButtonItem = right
    }
    
    @objc func addmemoriesAction(){
        let vc = MainClass.Memories.instantiateViewController(withIdentifier: ViewControllers.AddMemoriesVC.getController()) as! AddMemoriesVC
        vc.complitionHandler = { newData in
            let modal = classMateModal(profileImage: UIImage(), name: "jee", id: newData["id"]!, address: "", mobile: "", DOB: "", favourite: Bool(), email: SharedPreference.getUserData().email!, MemorieTitle: newData["MemorieTitle"]!, MemorieDate: newData["MemorieDate"]!, MemorieDiscription: newData["MemorieDiscription"]!)
            self.arrMemories.append(modal)
        }
        self.present(vc, animated: true)
    }
    
    fileprivate func configureUI() {
        self.setupSideMenu()
        self.navigationItem.title = "Memories"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.addMemories()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: false)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension MemoriesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMemories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMemories", for: indexPath) as! CellMemories
        cell.data = self.arrMemories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MainClass.Memories.instantiateViewController(withIdentifier: ViewControllers.MemoriesDetailVC.getController()) as! MemoriesDetailVC
        vc.data = self.arrMemories[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
