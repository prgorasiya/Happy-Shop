//
//  ProductImageViewCell.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import Kingfisher

class ProductImageViewCell: UITableViewCell {
        
    @IBOutlet var imgView: UIImageView!
    
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
        let url = URL(string: model.img_url!)!
        self.imgView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder.png"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil, completionHandler: nil)
    }
}
