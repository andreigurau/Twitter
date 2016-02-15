//
//  ComposeTweetViewController.swift
//  Twitter
//
//  Created by Andrei Gurau on 2/14/16.
//  Copyright © 2016 Andrei Gurau. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {

    @IBOutlet weak var tweetTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCompose(sender: AnyObject) {
        var message = tweetTextField.text
        
        if message != ""
        {
        
        TwitterClient.sharedInstance.test(message!)
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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
