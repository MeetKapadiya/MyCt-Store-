//
//  VendorTableViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit



class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var storeCountLabel: UILabel!
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var vendorCollecationView: UICollectionView!
    
    var arrVendores: [VendorViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorCollecationView.register(UINib(nibName: "VendorCollectionViewCell", bundle: nil),
        forCellWithReuseIdentifier: "VendorCollectionViewCell")
    }
    
    func set(arrVendore: [VendorViewModel]){
        self.arrVendores = arrVendore
        vendorCollecationView.delegate = self
        vendorCollecationView.dataSource = self
        vendorCollecationView.reloadData()
    }
}

extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrVendores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorCollectionViewCell", for: indexPath) as! VendorCollectionViewCell
        let vendor: VendorViewModel = arrVendores[indexPath.row]
        cell.nameLabel.text = vendor.getId()
        cell.priceLabel.text = vendor.getDeliveryCharge()
        return cell
    }
}

extension VendorTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 384, height: 133)
    }
}
