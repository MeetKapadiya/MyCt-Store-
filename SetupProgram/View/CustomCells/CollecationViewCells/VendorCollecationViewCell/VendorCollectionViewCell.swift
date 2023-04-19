//
//  VendorCollectionViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit

class VendorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var likeButton: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
