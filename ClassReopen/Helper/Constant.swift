//
//  Constant.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 20/07/21.
//

import Foundation
import UIKit


struct MainClass {
    static let  main = UIStoryboard(name: "Main", bundle: .main)
    static let  Home  = UIStoryboard(name: "Home", bundle: .main)
    static let  Classmates  = UIStoryboard(name: "ClassMates", bundle: .main)
    static let  Events  = UIStoryboard(name: "Events", bundle: .main)
    static let Memories = UIStoryboard(name: "Memories", bundle: .main)
    
    static let appdelegate = UIApplication.shared.delegate as! AppDelegate
}

struct SceneClass {
    static let mySceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
}

struct baseUrl {
    static let aboutUs = "https://www.bitcot.com/about-us/"
    static let privacy = "https://www.bitcot.com/privacy/"
    static let company = "https://www.bitcot.com/"
    static let app = "https://abounding-arithmetic-1587.glideapp.io/"
}

struct SocialKeys {
    static let googleClintID = "175602078734-us0d1k3rjj65t8f6niem9qlt9phmisb6.apps.googleusercontent.com"
}

struct AppName {
    static let app = "Class Reunion"
}

enum reasonRsvp {
    case Attending
    case NotAttending
    case MayBe
    
    func getRaason() -> String{
        switch self {
        case .Attending:
            return "Attending"
        case .NotAttending:
            return "Not Attending"
        case .MayBe:
            return "May Be"
        }
    }
}



enum ViewControllers {
    case LogInVC
    case EnterPinVC
    case HomeVC
    case MainTabBarController
    case EventVC
    case ClassMateDetailVC
    case EventDetailsVC
    case RSVPedVC
    case RSVPedPreviewVC
    case EditItemVC
    case MemoriesDetailVC
    case SortVC
    case SendFeedbackVC
    case ReportThisAppVC
    case ReportListVC
    case GalleryDetailsVC
    case AddMemoriesVC
    case DiscriptionVC
    
    func getController() -> String  {
        switch self{
        
        case .LogInVC:
            return "LogInVC"
        case .EnterPinVC:
            return "EnterPinVC"
        case .HomeVC:
            return "HomeVC"
        case .MainTabBarController:
            return "MainTabBarController"
        case .EventVC:
            return "EventVC"
        case .ClassMateDetailVC:
            return "ClassMateDetailVC"
        case .EventDetailsVC:
            return "EventDetailsVC"
        case .RSVPedVC:
            return "RSVPedVC"
        case .RSVPedPreviewVC:
            return "RSVPedPreviewVC"
        case .EditItemVC:
            return "EditItemVC"
        case .MemoriesDetailVC:
            return "MemoriesDetailVC"
        case .SortVC:
            return "SortVC"
        case .SendFeedbackVC:
            return "SendFeedbackVC"
        case .ReportListVC:
            return "ReportListVC"
        case .ReportThisAppVC:
            return "ReportThisAppVC"
        case .GalleryDetailsVC:
            return "GalleryDetailsVC"
        case .AddMemoriesVC:
            return "AddMemoriesVC"
        case .DiscriptionVC:
            return "DiscriptionVC"
        }
    }
}


struct UseCaseMessage {
    struct alertMessage {
        static let Logout = "Are you sure! do you want to logout?"
    }
    
    struct Title {
        static let yes = "Yes"
        static let No = "No"
        static let done = "Done"
    }
}
