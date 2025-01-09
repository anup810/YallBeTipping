//
//  ReceiptTipRow.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-08.
//

import UIKit

class ReceiptTipRow: UITableViewCell {

    @IBOutlet weak var tipLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(tip: TipOption){
        tipLabel.text = tip.toString()
    }

}
