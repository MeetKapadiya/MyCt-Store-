//
//  Order.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 10/04/23.
//

import Foundation


struct Order: Decodable{
    var error: Bool
    var arrStore: [StoreData]
}

enum CodingKeys: String, CodingKey{
    case error
    case arrStore = "data"
}
