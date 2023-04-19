//
//  AreaApiResponce.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 31/03/23.
//

import Foundation

struct ApiRespionce: Decodable{
    let error: Bool
    let data: [Area]
}
