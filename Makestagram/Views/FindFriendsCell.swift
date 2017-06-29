//
//  FindFriendsCell.swift
//  Makestagram
//
//  Created by apple on 6/29/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class FindFriendsCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
        print("followed")
    }
    
}
