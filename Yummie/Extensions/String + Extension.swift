//
//  String + Extension.swift
//  Yummie
//
//  Created by Lukich on 14.08.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
