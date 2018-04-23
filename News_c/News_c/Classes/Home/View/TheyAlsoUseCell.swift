//
//  TheyAlsoUseCell.swift
//  News_c
//
//  Created by 杨博兴 on 2018/4/11.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit

class TheyAlsoUseCell: UITableViewCell, RegisterCellFromNib {

    var leftLabel : UILabel!
    var rightButton : UIButton!
    var bottomView : UIView!
    var collectionView : UICollectionView!
    
    var theyUse = SmallVideo(){
        didSet {
            leftLabel.text = theyUse.title
            rightButton.setTitle(theyUse.show_more, for: .normal)
            userCards = theyUse.user_cards
            collectionView.reloadData()
        }
    }
    
    var userCards = [UserCard]()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        theme_backgroundColor = "colors.cellBackgroundColor"
        bottomView.theme_backgroundColor = "colors.separtorViewColor"
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(5, 15, 10, 10)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 215)
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension TheyAlsoUseCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.cl_dequequeReusableSupplementaryHeaderView(indexPath: indexPath) as
        
//        cell.
        
        return UICollectionViewCell()
        
    }
    
}
