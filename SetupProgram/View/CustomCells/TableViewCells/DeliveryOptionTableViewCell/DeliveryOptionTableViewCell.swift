//
//  DeliveryOptionTableViewCell.swift
//  SetupProgram
//
//  Created by Meet Kapadiya on 29/03/23.
//

import UIKit

class DeliveryOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var deliveryOptionSegment
    : UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)], for: .selected)
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
        deliveryOptionSegment.backgroundColor = UIColor.clear
    }
    @IBAction func deliveryOptionSegmentTapped(_ sender: UISegmentedControl){
        
    }
    
}
