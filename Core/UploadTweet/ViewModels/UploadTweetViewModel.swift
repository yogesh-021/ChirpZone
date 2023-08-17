//
//  UploadTweetViewModel.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 12/08/23.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweeet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                //dismiss view
                self.didUploadTweeet = true
            } else {
                //show error
            }
        }
    }
}
