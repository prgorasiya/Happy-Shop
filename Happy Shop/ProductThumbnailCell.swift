//
//  ProductThumbnailCell.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import Kingfisher

class ProductThumbnailCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var saleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateWithModel(model: ProductModel) {
        let url = URL(string: model.img_url!)!
        self.imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder.png"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil, completionHandler: nil)
        self.titleLabel.text = model.name
        self.priceLabel.text = String(format: "$%.2f", arguments: [model.price!])
        self.saleLabel.isHidden = !model.under_sale!
        self.titleLabel.font = self.titleLabel.font.withSize(13)
        self.priceLabel.font = self.priceLabel.font.withSize(13)
        self.saleLabel.font = self.saleLabel.font.withSize(13)
    }
}



