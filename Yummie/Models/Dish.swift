//
//  Dish.swift
//  Yummie
//
//  Created by Lukich on 14.08.2022.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedClories: String {
        return "\(calories ?? 0) calories"
    }
}
