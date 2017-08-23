//
//  ProductTitleCell.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit

class ProductTitleCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var saleLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateWithModel(model: ProductModel) {
        self.titleLabel.text = model.name
        self.priceLabel.text = String(format: "$%.2f", arguments: [model.price!])
        self.saleLabel.isHidden = !model.under_sale!
        self.titleLabel.font = self.titleLabel.font.withSize(15)
        self.priceLabel.font = self.priceLabel.font.withSize(15)
        self.saleLabel.font = self.saleLabel.font.withSize(15)
    }
}
