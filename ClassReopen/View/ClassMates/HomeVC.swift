//
//  ViewController.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit

class HomeVC: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet weak var colList: UICollectionView!
    @IBOutlet weak var colListHeight: NSLayoutConstraint!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnFavourites: UIButton!
    
    
    var arrData: [String] = []{
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.colListHeight.constant = self.colList.collectionViewLayout.collectionViewContentSize.height
                self.colList.reloadData()
            }
//            colList.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        }
    }
    
    //MARK: default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Classmates"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: true)
        self.arrData = ["dsds","dsdsds","dsds","dsdsds","dsds","dsdsds","dsds","dsdsds","dsds","dsdsds","dsds","dsdsds","dsds","dsdsds",]
        
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if(keyPath == "contentSize"){
//            if let newvalue = change?[.newKey]
//            {
//                let newsize  = newvalue as! CGSize
//                colListHeight.constant = newsize.height
//                colList.reloadData()
//            }
//        }
//    }
//
//    deinit {
//        removeObserver(self, forKeyPath: "contentSize")
//    }
    //MARK: default function
    @IBAction func btnActions(_ sender: UIButton){
        sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sender.setTitleColor(#colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1), for: .normal)
        switch sender {
        case btnAll:
            self.btnFavourites.backgroundColor = .clear
            self.btnFavourites.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            break
        case btnFavourites:
            self.btnAll.backgroundColor = .clear
            self.btnAll.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            break
        default:
            break
        }
    }
    
    @IBAction func btnTapEvents(_ sender: UIButton){
        switch sender.tag {
        case 0://Home
            break
        case 1://Events
            self.pushOtherVC(ViewControllers.EventVC.getController())
            break
        case 2://Mmories
            break
        case 3://Gallery
            break
        case 4://Chat
            break
        default:
            break
        }
    }
    
    func pushOtherVC(_ str: String){
        let vc = MainClass.Home.instantiateViewController(withIdentifier: str)
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 230.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MainClass.Classmates.instantiateViewController(withIdentifier: ViewControllers.ClassMateDetailVC.getController()) as! ClassMateDetailVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
