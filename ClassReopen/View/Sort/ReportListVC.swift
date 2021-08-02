//
//  ReportListVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit

class ReportListVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var tblReason: UITableView!
    //MARK: variables
    var arrList = ["Displays inappropriate content","Impersonation and Intellectual Property","Privacy, Security, or Deception","Spam and Minimum Functionality", "Other"]
    var delegate: SelectReason?
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        tblReason.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func btnCloseAction(_ sender: UIButton){
        self.dismiss(animated: true) {
            
        }
    }

}


//MARK: UITableViewDelegate, UITableViewDataSource
extension ReportListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.arrList[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            self.delegate?.reasonIs(self.arrList[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
