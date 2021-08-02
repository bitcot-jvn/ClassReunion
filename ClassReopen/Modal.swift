//
//  Modal.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import Foundation
import UIKit

//MARK: LoginModal
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

//MARK: classMateModal
struct classMateModal:Equatable {
    var profileImage: UIImage?
    var name: String?
    var email: String?
    var address: String?
    var mobile: String?
    var DOB: String?
    var favourite: Bool?
    var id: String?
    var MemorieTitle: String?
    var MemorieDate: String?
    var MemorieDiscription: String?
    
    init() {}
    
    init(profileImage: UIImage, name: String, id: String, address: String, mobile: String, DOB: String, favourite: Bool, email: String, MemorieTitle: String, MemorieDate: String, MemorieDiscription: String) {
        self.profileImage = profileImage
        self.name = name
        self.id = id
        self.favourite = favourite
        self.address = address
        self.mobile = mobile
        self.DOB = DOB
        self.email = email
        self.MemorieTitle = MemorieTitle
        self.MemorieDate = MemorieDate
        self.MemorieDiscription = MemorieDiscription
    }
}
//MARK: EventModal
struct EventModal {
    var imgEvent: UIImage?
    var eventTitle: String?
    var eventDiscription: String?
    var Rsvp: [RsvpModal]?
    init() {
    }
    
    init(imgEvent: UIImage, eventTitle: String, eventDiscription: String, Rsvp: [RsvpModal]) {
        self.imgEvent = imgEvent
        self.eventTitle = eventTitle
        self.eventDiscription = eventDiscription
        self.Rsvp = Rsvp
    }
}

//MARK: RsvpModal
struct RsvpModal {
    var rsponse: String?
    var email: String?
    
    init() {
    }
    
    init(rsponse:String, email: String) {
        self.rsponse = rsponse
        self.email = email
    }
}

//MARK: EventModal
struct GalleryModal {
    var imgEvent: [UIImage]?
    var eventTitle: String?

    init() {
    }
    
    init(imgEvent: [UIImage], eventTitle: String) {
        self.imgEvent = imgEvent
        self.eventTitle = eventTitle
       
    }
}
