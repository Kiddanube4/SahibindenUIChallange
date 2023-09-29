//
//  detailCell.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 29.09.2023.
//

import UIKit

class detailCell: UITableViewCell {

    @IBOutlet private weak var imgProduct: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblSubTitle: UILabel!
    @IBOutlet private weak var lblDetailTitle: UILabel!
    
    var cellSelectionHandler: (()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let handler = cellSelectionHandler {
            handler()
        }
    }
    
    func setCell(title: String, subTitle: String, detailTitle: String?, image: UIImage, isDetail: Bool) {
        if !isDetail {
            lblDetailTitle.isHidden = true
        }else {
            lblDetailTitle.isHidden = false
        }
        lblTitle.text = title
        lblSubTitle.text = subTitle
        lblDetailTitle.text = detailTitle
        imgProduct.image = image
    }

}
