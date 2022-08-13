//
//  OnboaringCollectionViewCell.swift
//  Yummie
//
//  Created by Lukich on 13.08.2022.
//

import UIKit

class OnboaringCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboaringCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboaringSlide) {
        
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
