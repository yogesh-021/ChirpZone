//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 12/01/23.
//

import Foundation

class FeedViewModel:ObservableObject{
    @Published var tweets=[Tweet]()
    let userService=UserService()
    let service=TweetService()
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        service.fetchTweets { tweets in
            self.tweets=tweets

            for i in 0..<tweets.count{
                let uid=tweets[i].uid
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user=user
                }
            }
 
        }
        
    }
}
