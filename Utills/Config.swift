//
//  Config.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 28/03/23.
//

import Foundation
import UIKit

struct Config{
    static let appName = "MyCt Store"
    static let dataBaseName = "myctstore.db"
    static let storyBord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink: String = "https://Play.google.com/store/apps/details?.id=com.pragma.myctStore"
    static let IOSLink: String = "item-apps://itunes.apple.com/us/app/apple-store/id152347410?mt=8"
    static let iosSharingText: String = "Simple Odre Your Food"
    static let appDateFormat = "dd mmm yyyy"
    static let appTimeFormat = "hh:mm a"
    static let serverDateFormat: String = "yyyy-mm-dd"
    static let amountSign: String = "₹"
    
    static func isInternetAvialble() -> Bool {
        let rechabilty = Reachability()!
        return rechabilty.isReachable ? (rechabilty.isReachableViaWiFi ||
                                         rechabilty.isReachableViaWWAN) : false
    }
    
    static let baseURL: String =
    "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCateegories: String = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForIMage: String = "https://myct.store/admin/uploads/"
}
