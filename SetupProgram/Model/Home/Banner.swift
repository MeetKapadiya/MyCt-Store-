//
//  BannerPhoto.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 01/04/23.
//

import Foundation
struct Banner: Decodable {
    var vendorId: Int
    var status: String
    var businessName: String
    var bannerId: Int
    var bannerImage: String
    
    enum CodingKeys: String, CodingKey {
        case vendorId = "v_id"
        case businessName = "business_name"
        case bannerId = "bid"
        case bannerImage = "filename"
        case status
    }
}

struct BannerViewModel{
    
    private let banner: Banner
    init(banner: Banner) {
        self.banner = banner
    }
    
    func getId() -> Int { banner.bannerId }
    func getImage() -> String {
        return Config.baseURLForIMage + (banner.bannerImage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
