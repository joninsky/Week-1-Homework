//
//  ViewController.swift
//  TwitterClone
//
//  Created by Jon Vogel on 1/5/15.
//  Copyright (c) 2015 Jon Vogel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
  var tweets = [Tweets]()
  
  @IBOutlet weak var myTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //set the datasource of the tableview to this viewcontroller
    self.myTableView.dataSource = self
    //get the file path for the JSON Data
    if let jsonFilePath = NSBundle.mainBundle().pathForResource("tweets", ofType: "json") {
      //create an NSData object out of the URL for the JSON File
      let testData = NSData(contentsOfFile: jsonFilePath)
      if let jsonData = NSData.dataWithContentsOfFile(jsonFilePath, options: nil, error: nil) {
        //Create an error variable that the JSONObjectWithData method will point to if it fails
        var error: NSError?
        //create an array of json data that is typed as an array of [AnyObject]
        if let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [AnyObject]{
          //Loop through the array of json Data
          for t in jsonArray{
            //set jsonDictionary equal one of the objects in the json array only if it can downcast to type [String: AnyObject]
            if let jsonDictionary = t as? [String: AnyObject]{
              //create a new Tweet object using the jsonDictionary object we have parsed down to
              let tweet = Tweets(JSONDataForTweet: jsonDictionary)
                //append it to the array of Tweets property
                self.tweets.append(tweet)
            }
          }
        }
      }
    }
    
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var Cell = tableView.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as TweetCell
    
    let tweet = tweets[indexPath.row]
    Cell.lblTweet.text = tweet.tweetText as? String
    Cell.lblUser.text = tweet.userName
    return Cell
  }
  

}

