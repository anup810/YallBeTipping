//
//  HomeTableCell.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
   
    }
    func configure(item: MenuItem){
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)"
        img.image = UIImage(named: item.img)
        
        
    }

}
