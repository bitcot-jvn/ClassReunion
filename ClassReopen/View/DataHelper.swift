//
//  DataHelper.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import Foundation

//SingleTon class
class DataHelper {
    
    static var shared = DataHelper()
    
    var setdata = [classMateModal(profileImage: #imageLiteral(resourceName: "men1"), name: "John C Reynoso ", id: "568-99-1535", address: "4825 Locust Court", mobile: "7805969344", DOB: "1/27/1961", favourite: false, email: "John@yopmail.com", MemorieTitle: "Last school days", MemorieDate: "June '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "men2"), name: "Justin A Reiber ", id: "422-68-0312", address: "4896 Maple Lane", mobile: "34242424", DOB: "12/10/1980", favourite: false, email: "Justin@yopmail.com",MemorieTitle: "school days", MemorieDate: "July '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "men3"), name: "George P Hernandez ", id: "420-23-9706", address: "2974 Ferry Street", mobile: "234242424", DOB: "10/10/1988", favourite: false, email: "George@yopmail.com",MemorieTitle: "first school days", MemorieDate: "Aug '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "men4"), name: "John B Larson ", id: "416-37-0425", address: "3871 Lonely Oak Drive", mobile: "42424243878", DOB: "1/12/1966", favourite: false, email: "Larson@yopmail.com",MemorieTitle: "remeber days", MemorieDate: "Aug '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "men5"), name: "Donny J Sheeley ", id: "416-57-4896", address: "5005 George Avenue", mobile: "87878787887", DOB: "9/15/1970", favourite: false, email: "Donny@yopmail.com",MemorieTitle: "memorable school days", MemorieDate: "Aug '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "girl1"), name: "Gricelda C Ellis ", id: "419-94-0579", address: "1984 Quarry Drive", mobile: "78787878787", DOB: "6/7/1996", favourite: false, email: "Gricelda@yopmail.com", MemorieTitle: " school", MemorieDate: "Aug '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"),
                   classMateModal(profileImage: #imageLiteral(resourceName: "girl2"), name: "Deloris K Berry ", id: "420-92-0779", address: "617 Willow Greene Drive", mobile: "878787878", DOB: "4/1/1961", favourite: false, email: "Deloris@yopmail.com", MemorieTitle: "days", MemorieDate: "Aug '89", MemorieDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout")]
    
    
    var setDataForEvent = [EventModal(imgEvent: #imageLiteral(resourceName: "Event1"), eventTitle: "Dinner", eventDiscription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here", Rsvp: [RsvpModal(rsponse: reasonRsvp.MayBe.getRaason(), email: "h@yopmail.com"), RsvpModal(rsponse: reasonRsvp.NotAttending.getRaason(), email: "jack@yopmail.com")]),
                           EventModal(imgEvent: #imageLiteral(resourceName: "Event2"), eventTitle: "School part", eventDiscription: "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)", Rsvp: [RsvpModal(rsponse: reasonRsvp.MayBe.getRaason(), email: "kk@yopmail.com"), RsvpModal(rsponse: reasonRsvp.Attending.getRaason(), email: "harry@yopmail.com")]),
                           EventModal(imgEvent: #imageLiteral(resourceName: "Event3"), eventTitle: "Disco night", eventDiscription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", Rsvp: [RsvpModal(rsponse: reasonRsvp.MayBe.getRaason(), email: "h@yopmail.com")])]
    
    
    var setDataForGallery = [GalleryModal(imgEvent: [#imageLiteral(resourceName: "Event1"),#imageLiteral(resourceName: "men4")], eventTitle: "New Gallery"),GalleryModal(imgEvent: [#imageLiteral(resourceName: "girl1"),#imageLiteral(resourceName: "men1")], eventTitle: "My Gallery")]
}
