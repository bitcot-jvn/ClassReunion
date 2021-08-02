//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    func hideNavigationBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    

    func showNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1)
    }
    
    func navigationLargePreferStyle(_ show: Bool){
        self.navigationController?.navigationBar.prefersLargeTitles = show
    }

    func setRightAndLeftBarButton(leftButton: Bool, rightButton: Bool){
        
        let left = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: #selector(leftBarAction))
        self.navigationItem.leftBarButtonItem = left
        let right = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .done, target: self, action: #selector(rightBarAction))
        if leftButton && !rightButton{
            self.navigationItem.leftBarButtonItem = left
        }else if leftButton && rightButton{
            self.navigationItem.rightBarButtonItem = right
            self.navigationItem.leftBarButtonItem = left
        }
    }
    
    func addMemories(){
        let right = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addmemoriesAction))
        self.navigationItem.rightBarButtonItem = right
    }
    
    func sortAction(){
        let right = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .done, target: self, action: #selector(rightBarAction))
        self.navigationItem.rightBarButtonItem = right
    }
    
    @objc func leftBarAction(){
        print("click left")
    }
    
    @objc func rightBarAction(){
        print("click Right")
    }
    
    @objc func addmemoriesAction(){
        print("click Right")
    }
}


extension UINavigationController{
    func setUpPreference(){
        
    }
}
