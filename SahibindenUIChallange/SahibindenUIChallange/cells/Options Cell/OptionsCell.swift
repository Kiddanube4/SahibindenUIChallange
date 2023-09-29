//
//  OptionsCell.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 28.09.2023.
//

import UIKit

class OptionsCell: UITableViewCell {

    @IBOutlet private weak var lblChoice: UILabel!
    @IBOutlet private weak var btnChoose: UIButton!
    var optionHandler: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func btnChoiceAction(_ sender: UIButton) {
        if let handler = optionHandler {
            handler()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    func setOptionLabel(option: String) {
        lblChoice.text = option
        
    }
    
}
