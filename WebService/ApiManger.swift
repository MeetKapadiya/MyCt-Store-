//
//  ApiManger.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 31/03/23.
//

import Foundation
import Alamofire

class ApiManger{
    
    func request(with url: String,
                 methodType: HTTPMethod = .get,
                 header: HTTPHeaders? = nil,
                 parameters: Parameters? = nil,
                 comletionHader: @escaping(Result<Data, ApiError>) -> Void) {
        guard let url = URL(string: url) else {
            comletionHader(.failure(.urlDoesNotFound))
            return
        }
        
        AF.request(url,method: methodType,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: header).responseData { response in
            
            guard let statusCode = response.response?.statusCode, (200...299).contains(statusCode)
            else {
                comletionHader(.failure(.invalidResponce))
                return
            }
            
            guard let data = response.data
            else {
                comletionHader(.failure(.dataNotFound))
                return
            }
            comletionHader(.success(data))
        }
    }
}


enum ApiError: Error{
    case urlDoesNotFound
    case invalidResponce
    case dataNotFound
}

