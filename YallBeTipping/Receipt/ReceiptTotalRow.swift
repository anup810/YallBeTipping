//
//  ReceiptTotalRow.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-08.
//

import UIKit

class ReceiptTotalRow: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(total: Double){
        totalLabel.text = "\(total)"
        
    }
}
