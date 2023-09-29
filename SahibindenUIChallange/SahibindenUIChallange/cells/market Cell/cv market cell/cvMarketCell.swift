//
//  cvMarketCell.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 28.09.2023.
//

import UIKit

class cvMarketCell: UICollectionViewCell {

    @IBOutlet private weak var lblSubtitle: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgProduct: UIImageView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProduct.contentMode = .scaleAspectFit
        lblTitle.textAlignment = .center
        lblSubtitle.textAlignment = .center
        cellView.layer.borderColor = UIColor.black.cgColor
        cellView.layer.borderWidth = 0.8
        
    }
    
    func setCell(productTitle: String, productSubtitle: String, productImage: UIImage) {
        lblTitle.text = productTitle
        lblSubtitle.text = productSubtitle
        imgProduct.image = productImage
    }
    func getCellData() -> [String:Any] {
        
        let cellData: [String:Any] = ["title": lblTitle.text ?? "nullText",
                                      "subtitle": lblSubtitle.text ?? "nullTExt",
                                      "Image": imgProduct.image ?? UIImage()
                                     ]
        return cellData
    }

}
