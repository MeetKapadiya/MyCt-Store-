//
//  StoreViewController.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 10/04/23.
//

import UIKit

class StoreViewController: UIViewController {
 
    @IBOutlet weak var storeTableView: UITableView!
    let storeViewModel: orderViewModel = orderViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        storeViewModel.fetchDetails { result in
            switch result {
            case .success:
                print("Reload TableView")
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert view")
            }
        }
    }
    private func storeNib(){
        let nibFile: UINib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        storeTableView.register(nibFile, forCellReuseIdentifier: "OrderTableViewCell")
    }
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
        return cell
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return storeViewModel.numberOfSecation()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeViewModel.numberOfRow()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
