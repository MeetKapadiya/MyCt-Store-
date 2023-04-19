//
//  OrderViewModel.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 10/04/23.
//

import Foundation
import Alamofire

final class orderViewModel{
    private let apiManger: ApiManger = ApiManger()
    private(set) var arrStoreOrder: [StoreDataViewModel] = []

    
    func fetchDetails(completion: @escaping(Result<(), Error>) -> Void){
        apiManger.request(with: ApiEndPoints.getOrder.url, methodType: .get) { response in
            switch response{
            case .success(let data):
                do {
                    let orderPageApiResponce = try JSONDecoder().decode(Order.self, from: data)
                    self.arrStoreOrder = orderPageApiResponce.arrStore.map{StoreDataViewModel(storeData: $0)}
                    print(self.arrStoreOrder)
                } catch {
                    print(error)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension orderViewModel{
    func numberOfSecation() -> Int{ return 1}
    func numberOfRow() -> Int { return 1 }
}

