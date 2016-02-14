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
    

    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var favoritesImage: UIImageView!
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
        print(tweet?.favorites)
        let favoritesNum: Int! = tweet!.favorites
        var favoritesString = String(favoritesNum)
        favoritesLabel.text = favoritesString + " Favorites"
        //favoritesImage.image = UIImage(named: "Hearts Filled-50")
        
        
            
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func testButton(sender: AnyObject) {
        print("ASDFASDF")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
