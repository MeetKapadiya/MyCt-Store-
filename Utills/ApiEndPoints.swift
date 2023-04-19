//
//  ApiEndPoints.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 31/03/23.
//

import Foundation

enum ApiEndPoints{
    
    case getArea
    case getCity
    case homePage
    case getOrder
    
    var url: String{
        switch self {
        case .getArea:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homePage:
            return "\(Config.baseURL)/homepage"
        case .getOrder:
            return "\(Config.baseURL)/"
        }
    }
}
