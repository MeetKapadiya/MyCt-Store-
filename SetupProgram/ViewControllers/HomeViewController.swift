//
//  HomeViewController.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlte
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Variables
    var viewModel: HomeViewModel = HomeViewModel()
    var viewModel2: orderViewModel = orderViewModel()
    var tableViewCells: [String] = ["LocationTableViewCell", "CategoriesTableViewCell", "BannerTableViewCell", "DeliveryOptionTableViewCell","VendorTableViewCell"]
    
    // MARK: - LifeCycleMethod
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fatchHomePageDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setup(){
        tableViewCells.forEach{ cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
    }
    
    private func fatchHomePageDetails(){
        guard Config.isInternetAvialble() else {
            print("Desplay No Itenet Avialble ")
            return
        }
        
        viewModel2.fetchDetails { result in
            switch result {
            case .success:
                print("Reload TableView")
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert Value")
            }
        }
        
        viewModel.fetchDetails { result  in
            switch result {
            case .success:
                print("reloadTableView")
                self.tableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert value")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSecation()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
            cell.set(arrCategories: viewModel.arrCategories)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.set(arrBanners: viewModel.arrBanners)
            return cell
        case 3:
            let cell: DeliveryOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOptionTableViewCell") as! DeliveryOptionTableViewCell
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell") as! VendorTableViewCell
            cell.set(arrVendore: viewModel.arrVendors)
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 120
        case 1: return 54
        case 2: return 110
        case 3: return 60
        case 4: return 150
        default: return 44
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0: return 0
        case 1: return 8
        case 2: return 0
        case 3: return 16
        case 4: return 5
        default: return 16
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        return headerView
    }
}
