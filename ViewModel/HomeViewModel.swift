//
//  HomeViewModel.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 01/04/23.
//

import Foundation
import Alamofire

final class HomeViewModel {
    private(set) var secation: [HomePageTableSecation] = []
    private(set) var arrCategories: [StoreTypeViewModel] = []
    private(set) var arrBanners: [BannerViewModel] = []
    private(set) var arrVendors: [VendorViewModel] = []
    private(set) var vendorCount: Int = 0
    private let apiManger: ApiManger = ApiManger()
    private(set) var selectedCategoryIndex: Int = 0
    private(set) var selectedDeliveryINdex: Int = 0
    
    func fetchDetails(completion: @escaping(Result<(), Error>) -> Void){
        
        let patameters: Parameters = ["area_id" : "4",
                                      "city_id" : "1",
                                      "custid" : "",
                                      "store_type" : selectedCategoryIndex == 0 ? "" : arrCategories[selectedCategoryIndex].getId(),
                                      "type" : selectedDeliveryINdex == 0 ? "takeaway" : "Delivery"]
        
        
        apiManger.request(with: ApiEndPoints.homePage.url, methodType: .post, parameters: patameters) {  response in
            switch response{
            case .success(let data):
                do {
                    let homePageAPIResponce = try
                    JSONDecoder().decode(HomePageAPIResponce.self, from: data)
                    self.arrCategories = homePageAPIResponce.arrstoreType.map{ StoreTypeViewModel(storeType: $0)}
                    self.arrBanners = homePageAPIResponce.arrBanner.map{ BannerViewModel(banner: $0)}
                    self.arrVendors = homePageAPIResponce.arrVendor.map{ VendorViewModel(Vendor: $0)}
                    self.vendorCount = homePageAPIResponce.numberOfStore
                    self.loadSecation()
                    print(self.arrCategories)
                    completion(.success(()))
                } catch{
                    completion(.failure(ApiError.invalidResponce))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    private func loadSecation() {
        secation = []
        secation.append(.address)
        secation.append(.category(arrCategory: self.arrCategories))
        secation.append(.banner(arrBanner: self.arrBanners))
        secation.append(.deliveryOption(name: "takeway"))
        secation.append(.vendor(arrVendor: self.arrVendors))
    }
}

extension HomeViewModel{
    func numberOfSecation() -> Int{
        if arrCategories.count > 0, arrBanners.count > 0, arrVendors.count > 0 {
            return 5
        }
        return 0
    }
    func numberOfRow() -> Int { return 1 }
}

enum HomePageTableSecation{
    case address
    case category(arrCategory: [StoreTypeViewModel])
    case banner(arrBanner: [BannerViewModel])
    case deliveryOption(name: String)
    case vendor(arrVendor: [VendorViewModel])
}
