//
//  User.swift
//  Twitter
//
//  Created by Andrei Gurau on 2/7/16.
//  Copyright © 2016 Andrei Gurau. All rights reserved.
//

import UIKit


var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"


class User: NSObject {

    var name: String?
    var screenName: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary)
    {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        self.dictionary = dictionary
        
    }
    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
    }

    
    class var currentUser: User?
        {
        get{
        if _currentUser == nil
        {
            var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
        if data != nil
        {
        do
        {
            var dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
            _currentUser = User( dictionary: dictionary as! NSDictionary)
        }
        catch
        {
        
        }
        }
        }
            return _currentUser
        }
        set(user)
        {
            _currentUser = user
        if _currentUser != nil
            {
                do{
                    var data = try NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: [])
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                    
                }
                catch{
                    
                }
                
            }
            else
        {
            NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        
        }
    }
}
