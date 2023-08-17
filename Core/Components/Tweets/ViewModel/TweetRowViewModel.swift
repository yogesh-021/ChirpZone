//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 13/01/23.
//

import Foundation

class TweetRowViewModel:ObservableObject{
    @Published var tweet:Tweet
    let service=TweetService()
    init(tweet:Tweet){
        self.tweet=tweet
        checkIfUserLikedTweet()
    }

    func likeTweet(){
        self.service.likeTweet(tweet) {
            self.tweet.didLikeTweet=true
        }
    }

    func unlikeTweet(){
        self.service.likeTweet(tweet) {
            self.tweet.didLikeTweet=false
        }
    }

    func checkIfUserLikedTweet(){
        self.service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLikeTweet=true
            }
        }

    }
}
