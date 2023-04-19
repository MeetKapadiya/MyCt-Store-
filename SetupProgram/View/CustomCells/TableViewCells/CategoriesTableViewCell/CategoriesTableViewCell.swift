//
//  CategoriesTableViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit

protocol CategoriesTableViewCellDelegate: AnyObject{
    func didSelect(at index: Int)
}

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoriesCollecationView: UICollectionView!
    @IBOutlet weak var viewMore: UIButton!
    
    var arrCategories: [StoreTypeViewModel] = []
    weak var delegate: CategoriesTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesCollecationView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
  
       
    func set(arrCategories: [StoreTypeViewModel]){
        self.arrCategories = arrCategories
        categoriesCollecationView.delegate = self
        categoriesCollecationView.dataSource = self
        categoriesCollecationView.reloadData()
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton){
        
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout{
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150, height: 60)
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

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let category: StoreTypeViewModel = arrCategories[indexPath.row]
        cell.backgroundColor = AppColor.primaryColor
        cell.nameLabel.textColor = .white
        cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        cell.nameLabel.text = category.getType()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}
