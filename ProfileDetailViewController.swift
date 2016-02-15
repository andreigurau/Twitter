//
//  ProfileDetailViewController.swift
//  Twitter
//
//  Created by Andrei Gurau on 2/14/16.
//  Copyright © 2016 Andrei Gurau. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    
    var user2: User!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileBackgroundImageView: UIImageView!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("user description = \(user2.userDescription)")
        usernameLabel.text = user2.screenName
        nameLabel.text = user2.name
        let baseUrl = user2.profileImageUrl
        let imageUrl = NSURL(string: (baseUrl)!)
        profileImageView.setImageWithURL((imageUrl)!)
        descriptionLabel.text = user2.userDescription
        var followersNum: Int! = user2.followers
        var followersString = String(followersNum)
        followersLabel.text = followersString
        
        var followingNum: Int! = user2.following
        var followingString = String(followingNum)
        followingLabel.text = followingString
        
        var tweetsNum: Int! = user2.favorites
        var tweetsString = String(tweetsNum)
        tweetsLabel.text = tweetsString
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
