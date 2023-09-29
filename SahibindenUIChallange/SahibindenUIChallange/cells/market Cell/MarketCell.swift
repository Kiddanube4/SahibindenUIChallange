//
//  MarketCell.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 28.09.2023.
//

import UIKit

class MarketCell: UITableViewCell {

    @IBOutlet weak var cvMarketItems: UICollectionView!
    private let spacing: CGFloat = 16.0
    override func awakeFromNib() {
        super.awakeFromNib()
        cvMarketItems.register(UINib(nibName: "cvMarketCell", bundle: .main), forCellWithReuseIdentifier: "cvMarketCell")
        cvMarketItems.delegate = self
        cvMarketItems.dataSource = self
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.cvMarketItems?.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
//Extensions

extension MarketCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected at \(indexPath.row)")
        let cell = cvMarketItems.cellForItem(at: indexPath) as? cvMarketCell
        print(cell?.getCellData())
        
    }
}
extension MarketCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let marketCell = cvMarketItems.dequeueReusableCell(withReuseIdentifier: "cvMarketCell", for: indexPath) as? cvMarketCell else {return UICollectionViewCell()}
        marketCell.setCell(productTitle: "test", productSubtitle: "test", productImage: UIImage(systemName: "paperplane") ?? UIImage())
       
        return marketCell
        
    }
   
}
extension MarketCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
              let spacingBetweenCells:CGFloat = 16
              
              let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
              
              if let collection = self.cvMarketItems{
                  let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                  return CGSize(width: width, height: width)
              }else{
                  return CGSize(width: 0, height: 0)
              }
    }
}
