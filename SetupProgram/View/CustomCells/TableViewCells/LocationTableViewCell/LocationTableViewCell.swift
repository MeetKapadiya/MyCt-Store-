//
//  LocationTableViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {


    
  
    @IBOutlet weak var CityImage: UIImageView!
    @IBOutlet weak var AreaImage: UIImageView!
    
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewArea: UIView!
    
    @IBOutlet weak var btsSearch: UISearchBar!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnArea: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       viewCity.SetCorner(radious: 5)
       viewArea.SetCorner(radious: 5)
        
        viewCity.setBoder(width: 1, color: UIColor.white)
        viewArea.setBoder(width: 1, color: UIColor.white)
        
        backgroundColor = UIColor.blue
        
    
        btsSearch.tintColor = AppColor.primaryColor
        btsSearch.barTintColor = AppColor.primaryColor
        btsSearch.backgroundColor = AppColor.primaryColor
     
        btsSearch.isTranslucent = false
        
            let textFieldInsideSeachBar = btsSearch.value(forKey: "searchField") as? UITextField
            textFieldInsideSeachBar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSeachBar?.attributedPlaceholder = NSAttributedString(string: PlaceHolder.searchBar, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
    }
}

