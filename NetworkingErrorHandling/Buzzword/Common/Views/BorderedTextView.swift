//
//  TextViewExtension.swift
//  Buzzowrd
//
//  Created by Chris Weber on 22.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class BorderedTextView: UITextView {
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
    }
}