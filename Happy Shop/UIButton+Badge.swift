//
//  UIButton+Badge.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 23/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    func createCustomBarButton() -> UIButton {
        // button
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        rightButton.setBackgroundImage(UIImage(named: "cart.png"), for: .normal)
        
        let tabledata = UserDefaults.standard.mutableArrayValue(forKey: "cartItems")
        
        if tabledata.count > 0 {
            // badge label
            let label = UILabel(frame: CGRect(x: 18, y: -8, width: 18, height: 18))
            label.layer.borderColor = UIColor.clear.cgColor
            label.layer.borderWidth = 2
            label.layer.cornerRadius = label.bounds.size.height / 2
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.font = UIFont(name: "Helvetica Neue", size: 10)
            label.textColor = .white
            label.backgroundColor = .red
            label.text = String(format: "%d", arguments: [tabledata.count])
            
            rightButton.addSubview(label)
        }
        
        return rightButton
    }
}
