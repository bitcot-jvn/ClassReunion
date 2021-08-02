//
//  Modal.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import Foundation
import UIKit


struct LoginModal  {
    var email: String?
    var userID: String?
    var name: String?
    var profileImg: URL?
    
    
    init() {}
    
    init(email: String,userID: String, name: String, profileImg: URL) {
        self.email = email
        self.userID = userID
        self.name = name
        self.profileImg = profileImg
    }
}


struct classMateModal:Equatable {
    var profileImage: UIImage?
    var name: String?
    var id: String?
    var address: String?
    var mobile: String?
    var DOB: String?
    var email: String?
    var favourite: Bool?
    
    init() {}
    
    init(profileImage: UIImage, name: String, id: String, address: String, mobile: String, DOB: String, favourite: Bool, email: String) {
        self.profileImage = profileImage
        self.name = name
        self.id = id
        self.favourite = favourite
        self.address = address
        self.mobile = mobile
        self.DOB = DOB
        self.email = email
    }
}
