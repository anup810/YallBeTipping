//
//  ReceiptItemRow.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-08.
//

import UIKit

class ReceiptItemRow: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func configure(item: MenuItem){
        nameLabel.text = item.name
        countLabel.text = "\(item.count)"
        let count = Double(item.count)
        let totalPrice = item.price * count
        priceLabel.text = "\(totalPrice)"
        
    }

}
