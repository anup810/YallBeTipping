//
//  HomeTableCell.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit
protocol HomeTableCellDelegate: AnyObject{
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
    
}

class HomeTableCell: UITableViewCell {
    weak var delegate: HomeTableCellDelegate?
    var indexPath: IndexPath?

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var orderCountStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
   
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
    }
    func configure(item: MenuItem, indexPath: IndexPath){
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)"
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        if item.count > 0{
            orderCountStackView.isHidden = false
        } else{
            orderCountStackView.isHidden = true
            
        }
        
        
    }

    @IBAction func didTapPlusButton(_ sender: UIButton) {
        guard let indexPath else {return}
        delegate?.didAdd(at: indexPath)
    
    }
    
    @IBAction func didTaoMinusButton(_ sender: UIButton) {
        guard let indexPath else {return}
        delegate?.didMinus(at: indexPath)
    }
}
