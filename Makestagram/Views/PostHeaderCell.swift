//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by apple on 6/27/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    static let height: CGFloat = 54
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        //flag+dostuff
    }
}
