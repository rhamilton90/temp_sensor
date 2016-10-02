//
//  MaterialView.swift
//  Solve-it-3D
//
//  Created by HamiltonMac on 6/1/16.
//  Copyright © 2016 HamiltonMac. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    let SHADOW_COLOR: CGFloat = 157.0 / 255.0
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
    }

}
