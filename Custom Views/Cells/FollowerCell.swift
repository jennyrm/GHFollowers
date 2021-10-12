//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Jenny Morales on 10/11/21.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView()
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
}//End of class
