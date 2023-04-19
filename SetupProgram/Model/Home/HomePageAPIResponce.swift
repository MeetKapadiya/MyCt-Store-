//
//  HomePageAPIResponce.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 01/04/23.
//

import Foundation

struct HomePageAPIResponce: Decodable {
    var error: Bool
    var arrstoreType: [StoreType]
    var arrBanner: [Banner]
    var arrVendor: [Vendor]
    var numberOfStore: Int
    
    enum CodingKeys: String, CodingKey{
        case error
        case arrstoreType =  "store_type"
        case numberOfStore = "num_stores"
        case arrBanner = "banner"
        case arrVendor = "data"
    }
}
