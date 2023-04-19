//
//  OrderTableViewCell.swift
//  MyCt Store
//
//  Created by Meet Kapadiya on 10/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var reorderLabel: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var confiremdLabel: UILabel!
    
    @IBOutlet weak var cancelOrderLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
}
