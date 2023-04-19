//
//  StoreType.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 01/04/23.
//

import Foundation

struct StoreType: Decodable{
    var id: String
    var type: String
    var image: String
}

struct StoreTypeViewModel{
    
    private let storeType: StoreType
    
    init(storeType: StoreType) {
        self.storeType = storeType
    }
    
    func getId() -> String { storeType.id }
    func getType() -> String { storeType.type }
    func getImage() -> String {
        return Config.baseURLForCateegories + (storeType.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
