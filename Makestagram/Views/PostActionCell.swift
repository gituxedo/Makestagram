//
//  PostActionCell.swift
//  Makestagram
//
//  Created by apple on 6/27/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit

protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {
    
    weak var delegate:PostActionCellDelegate?
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    static let height: CGFloat = 46
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        //turn heart red, add a like
        print("I like this!")
        delegate?.didTapLikeButton(sender, on: self)
    }
}
