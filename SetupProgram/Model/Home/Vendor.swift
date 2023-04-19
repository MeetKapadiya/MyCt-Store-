//
//  Vendor.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 01/04/23.
//

import Foundation

struct Vendor: Decodable {
    var id: String
    var name: String
    var image: String
    var area: String
    var address: String
    var deliveryTime: String
    var deliveryTimeIn: String
    var minimumOrder: String
    var deliveryCharges: String
    var discount: String
    var rating: String
    var stats: String
    var isOpen: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, area, address, discount, rating, stats
        case deliveryTime = "delivery_time"
        case deliveryTimeIn = "delivery_time_in"
        case minimumOrder = "min_order"
        case deliveryCharges = "delivery_charges"
        case isOpen = "isopen"
    }
}

struct VendorViewModel{
    private let Vendor: Vendor
    
    init(Vendor: Vendor) {
        self.Vendor = Vendor
    }
    
    func getId() -> String { Vendor.id }
    func getName() -> String { Vendor.address }
    func getNameImage() -> String {
        return Config.baseURLForIMage + (Vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    func isOpen() -> Bool { Vendor.isOpen == "open"}
    func getDeliveryCharge() -> String {
        return "Delivery Fees: $\(Vendor.address)"
    }
    func getMinimumOder() -> String{
        return "Min.Oreders: $\(Vendor.deliveryCharges)"
    }
    func getRating() -> Float { Float(Vendor.rating) ?? 0}
    
    func isFav() -> Bool { Vendor.isOpen == "yes"}
}




