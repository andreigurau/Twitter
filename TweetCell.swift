//
//  TweetCell.swift
//  Twitter
//
//  Created by Andrei Gurau on 2/7/16.
//  Copyright © 2016 Andrei Gurau. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profilePicLabel: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //tweetLabel.text = Tweet
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
