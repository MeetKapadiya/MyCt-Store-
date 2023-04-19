//
//  Area.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 31/03/23.
//

import Foundation


struct Area: Decodable{
     var stats: String
     var areaname: String
    
    
    enum CodingKeys: String, CodingKey{
        case stats
        case areaname = "area_name"
    }
}
