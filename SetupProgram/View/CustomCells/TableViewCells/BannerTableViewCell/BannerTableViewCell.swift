//
//  BannerTableViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit
import SDWebImage

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerCollecationView: UICollectionView!
    
    var arrBanners: [BannerViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollecationView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil),
        forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
    
    func set(arrBanners: [BannerViewModel]){
        self.arrBanners = arrBanners
        bannerCollecationView.delegate = self
        bannerCollecationView.dataSource = self
        bannerCollecationView.reloadData()
    }
}


extension BannerTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let bannner: BannerViewModel = arrBanners[indexPath.row]
        cell.imagView.sd_setImage(with: URL(string: bannner.getImage()), placeholderImage: UIImage(systemName: "firePlace"))
        return cell
    }
}
