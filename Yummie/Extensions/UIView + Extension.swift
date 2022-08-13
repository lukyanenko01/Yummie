//
//  UIView + Extension.swift
//  Yummie
//
//  Created by Lukich on 13.08.2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

