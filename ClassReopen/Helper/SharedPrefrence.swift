//
//  SharedPrefrence.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//


import Foundation

class SharedPreference: NSObject {
   
    fileprivate let kemail = "__email_"
    fileprivate let kuser_id = "__kuser_id_"
    fileprivate let kname = "__kname_"
    fileprivate let kProfileImage = "__kProfileImage_"
   
    fileprivate let defaults = UserDefaults.standard
    static let sharedInstance = SharedPreference()
    class func saveUserData(user:LoginModal){
        sharedInstance.saveUserData(user)
    }
    
    
    fileprivate func saveUserData(_ user: LoginModal){
        defaults.set(user.email, forKey: kemail)
        defaults.set(user.userID, forKey: kuser_id)
        defaults.set(user.name, forKey: kname)
        defaults.set(user.profileImg, forKey: kProfileImage)
        defaults.synchronize()
    }
    
    fileprivate func deleteUserData(){
        defaults.removeObject(forKey: kemail)
        defaults.removeObject(forKey: kuser_id)
        defaults.removeObject(forKey: kname)
        defaults.removeObject(forKey: kProfileImage)
        defaults.synchronize()
    }
    
    class func clearUserData(){
        sharedInstance.clearUserData()
    }
    
    fileprivate func clearUserData(){
        self.deleteUserData()
    }
    
    class func getUserData() -> LoginModal{
        return sharedInstance.getUserData()
    }
    
    fileprivate  func getUserData() -> LoginModal {
        var user:LoginModal  = LoginModal()
        user.email          = defaults.value(forKey: kemail)  as? String
        user.userID          = defaults.value(forKey: kuser_id)  as? String
        user.name         = defaults.value(forKey: kname)  as? String
        user.profileImg         = defaults.url(forKey: kProfileImage)
      
        return user
    }
    
    func setCurrentLocation(lat: Double, long: Double){
        defaults.synchronize()
    }
    
    
//    fileprivate func setDeviceToken(_ token: String){
//        defaults.set(token, forKey: kDeviceToken);
//    }
//
//    fileprivate func getDeviceToken() -> String?{
//        return defaults.value(forKey: kDeviceToken) as? String;
//    }
//
//    class func storeDeviceToken(_ token: String) {
//        sharedInstance.setDeviceToken(token)
//    }
//
//    class func deviceToken() -> String {
//        return sharedInstance.getDeviceToken() ?? "1234567890"
//    }
    
  
}



