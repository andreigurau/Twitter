//
//  IndividualTweetViewController.swift
//  Twitter
//
//  Created by Andrei Gurau on 2/9/16.
//  Copyright © 2016 Andrei Gurau. All rights reserved.
//

import UIKit

class IndividualTweetViewController: UIViewController {

    var tweet: Tweet?
    

    var didRetweet = false
    var didFavorite = false

    
    @IBOutlet weak var testImageButton: UIButton!
    @IBOutlet weak var replyTextField: UITextField!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePicLabel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        dateLabel.text = tweet?.createdAtString
        nameLabel.text = tweet?.user?.name
        tweetLabel.text = tweet?.text
        let baseUrl = tweet?.user?.profileImageUrl
        let imageUrl = NSURL(string: (baseUrl)!)
        profilePicLabel.setImageWithURL((imageUrl)!)
        //print(tweet?.favorites)
        var favoritesNum: Int! = tweet!.favorites
        var favoritesString = String(favoritesNum)
        favoritesLabel.text = favoritesString + " Favorites"
        //favoritesImage.image = UIImage(named: "Hearts Filled-50")
        print(tweet?.id)
        var retweetNum: Int! = tweet!.retweets
        var retweetString = String(retweetNum)
        retweetLabel.text = retweetString + " Retweets"
        
        let testimage = profilePicLabel.image
        //testImageButton.setImage(testimage!, forState: UIControlState.Normal)
        testImageButton.setBackgroundImage(testimage!, forState: UIControlState.Normal)
        
        
            
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onReplyButton(sender: AnyObject) {
        print(replyTextField.text)
        var username = tweet?.user?.screenName
        
        if replyTextField.text != ""
        {
        TwitterClient.sharedInstance.reply(replyTextField.text!, username: username!)
        
        }
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
     view.endEditing(true)
    }

    @IBAction func onFavoritesButton(sender: AnyObject) {
        didFavorite = !didFavorite
        
        //favoritesButton.tintColor = UIColor.redColor()
        
        let idNum: Int! = tweet!.id
        var idString = String(idNum)
        
        if(didFavorite)
        {
            
           favoritesLabel.textColor = UIColor.redColor()
            var favoritesNum: Int! = tweet!.favorites! + 1
            var favoritesString = String(favoritesNum)
            favoritesLabel.text = favoritesString + " Favorites"
            TwitterClient.sharedInstance.favorite(idString)
        }
        else
        {
            favoritesLabel.textColor = UIColor.blackColor()
            var favoritesNum: Int! = tweet!.favorites!
            var favoritesString = String(favoritesNum)
            favoritesLabel.text = favoritesString + " Favorites"
            TwitterClient.sharedInstance.unfavorite(idString)
        }
        
    }
    
    @IBAction func onRetweetButton(sender: AnyObject) {
        didRetweet = !didRetweet
        
        //favoritesButton.tintColor = UIColor.redColor()
        
        let idNum: Int! = tweet!.id
        var idString = String(idNum)
        
        if(didRetweet)
        {
            
            retweetLabel.textColor = UIColor.greenColor()
            var retweetNum: Int! = tweet!.retweets! + 1
            var retweetString = String(retweetNum)
            retweetLabel.text = retweetString + " Retweets"
            TwitterClient.sharedInstance.retweet(idString)
            
        }
        else
        {
            favoritesLabel.textColor = UIColor.blackColor()
            var retweetNum: Int! = tweet!.retweets
            var retweetString = String(retweetNum)
            retweetLabel.text = retweetString + " Retweets"
            TwitterClient.sharedInstance.unretweet(idString)
            
        }
        
    }
    
        
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let cell = sender as! UITableViewCell
        //let indexPath = tableView.indexPathForCell(cell)
        //let tweet = tweets?[indexPath!.row]
        let user2 = tweet?.user
        let profileDetailViewController = segue.destinationViewController as! ProfileDetailViewController
        profileDetailViewController.user2 = user2
        
        //cell.selectionStyle = .None
        //let backgroundView = UIView()
        //backgroundView.backgroundColor = UIColor.redColor()
        //cell.selectedBackgroundView = backgroundView
        
        print("prepare for segue")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    

}
