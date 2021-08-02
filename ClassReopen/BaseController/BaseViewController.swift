//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit
import SideMenu
import SafariServices
import GoogleSignIn

class BaseViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.navigationController != nil{
            SceneClass.mySceneDelegate?.navController = self.navigationController!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //UINavigationController().setupNavigationPreference()
        
    }
    
    //MARK: setup side menu
    func showMenu(){
        let vc = MainClass.main.instantiateViewController(withIdentifier: "SideMenuVC")
        let menu = SideMenuNavigationController(rootViewController: vc)
        menu.menuWidth = self.view.bounds.width - 60.0
        menu.leftSide = true
        menu.presentationStyle = .menuSlideIn
        present(menu, animated: true, completion: nil)
    }
    
    func setupSideMenu() {
       // Define the menus
        let vc = MainClass.main.instantiateViewController(withIdentifier: "SideMenuVC")
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController:  vc)
        leftMenuNavigationController.menuWidth = self.view.bounds.width - 60.0
        leftMenuNavigationController.presentationStyle = .menuSlideIn
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        leftMenuNavigationController.statusBarEndAlpha = 0
   }
    
    
   

    //MARK: navigation bar
    func showNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1)
    }
    
    func hideNavigationBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func navigationLargePreferStyle(_ show: Bool){
        self.navigationController?.navigationBar.prefersLargeTitles = show
    }

    func setRightAndLeftBarButton(leftButton: Bool, rightButton: Bool){
        let left = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: #selector(leftBarAction))
        self.navigationItem.leftBarButtonItem = left
        self.navigationItem.leftBarButtonItem = left
    }
    
    func sortAction(){

    }
    
    @objc func leftBarAction(){
        self.showMenu()
    
    }

    //MARK: genrate qrCode
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
    //MARK: hide sshow animation view
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    //MARK: alertView
    func showAnouncement(message: String,yesTitle: String, noTitle: String, complition: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title: AppName.app, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: yesTitle, style: .default, handler: { alert in
            complition(alert)
        }))
        
        alert.addAction(UIAlertAction(title: noTitle, style: .cancel,handler: nil))
        self.present(alert, animated: true)
    }
    
    func showAnouncementOk(message: String,Ok: String, complition: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title: AppName.app, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Ok, style: .default, handler: { alert in
            complition(alert)
        }))
        self.present(alert, animated: true)
    }
    
    func openServices(urlStr: String, data: String){
        if let phoneCallURL = URL(string: "\(urlStr)\(data)") {
           let application:UIApplication = UIApplication.shared
           if (application.canOpenURL(phoneCallURL)) {
               application.open(phoneCallURL, options: [:], completionHandler: nil)
           }
         }
    }
}


extension BaseViewController{
    func selectedOptionSetup(_ index: Int){
        switch index {
        case 0://company
            self.openUrl(URL(string: baseUrl.company)!)
            break
        case 1://privacy
            self.openUrl(URL(string: baseUrl.privacy)!)
            break
        case 2://about
            self.openUrl(URL(string: baseUrl.aboutUs)!)
            
            break
        case 3://sign out
            self.showAnouncement(message: UseCaseMessage.alertMessage.Logout, yesTitle: UseCaseMessage.Title.yes, noTitle: UseCaseMessage.Title.No, complition: { [self]_ in
                self.dismiss(animated: false, completion: nil)
                if SharedPreference.getUserData().userID != nil{
                    GIDSignIn.sharedInstance.signOut()
                }
                logout()
            })
            break
        default:
            break
        }
    }
    
    func logout(){
        SharedPreference.clearUserData()
        let vc  = MainClass.main.instantiateViewController(withIdentifier: ViewControllers.LogInVC.getController()) as! LogInVC
        let nav = UINavigationController(rootViewController: vc)
        SceneClass.mySceneDelegate?.window!.rootViewController = nav
      //  SceneClass.mySceneDelegate?.window!.makeKeyAndVisible()
    }
    
    func openUrl(_ url: URL){
        let svc = SFSafariViewController(url: url)
        svc.modalPresentationStyle = .popover
        present(svc, animated: true, completion: nil)
    }
}

extension UINavigationController{
    func setupNavigationPreference(){
      
     
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
       if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
         popToViewController(vc, animated: animated)
       }
     }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
