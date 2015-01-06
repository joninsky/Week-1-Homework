//
//  Tweets.swift
//  TwitterClone
//
//  Created by Jon Vogel on 1/5/15.
//  Copyright (c) 2015 Jon Vogel. All rights reserved.
//

import Foundation

class Tweets {
  
  var tweetText: AnyObject
  var userName: String
  
  init(JSONDataForTweet: [String: AnyObject]) {
    self.tweetText = JSONDataForTweet["text"]!
    let userDic = JSONDataForTweet["user"]! as? [String: AnyObject]
    self.userName = userDic!["name"] //as? String
  }
  
}