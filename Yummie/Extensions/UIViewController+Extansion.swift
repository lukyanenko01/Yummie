//
//  UIViewController+Extansion.swift
//  Yummie
//
//  Created by Lukich on 15.08.2022.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self{
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        return storybord.instantiateViewController(withIdentifier: identifier) as! Self
    }
    
}
