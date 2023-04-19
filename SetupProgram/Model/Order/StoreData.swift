//
//  StoreData.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 10/04/23.
//

import Foundation

struct StoreData: Decodable{
    var id: String
    var name: String
    var oreder: String
    var image: String
    var totalPrice: String
    var dateTime: String
    
    enum CodingKeys: String, CodingKey{
        case id = "order_id"
        case name = "vname"
        case oreder = "oreder_status"
        case image = "vimage"
        case totalPrice = "total_price"
        case dateTime = "date_time"
    }
}

struct StoreDataViewModel{
    private let storeData: StoreData
    
    init(storeData: StoreData) {
        self.storeData = storeData
    }
    
    func getOrderId() -> String { storeData.id }
    func getName() -> String { storeData.image }
    func getNameImage() -> String {
        return Config.baseURLForIMage + (storeData.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        func getOrder() -> String { storeData.oreder }
        func getTotalPrice() -> String { storeData.totalPrice }
        func getDateTime() -> String { storeData.dateTime }
    }
}
