//
//  Feed.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 06/01/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView=false
    @ObservedObject var viewModel=FeedViewModel()
    
    var body: some View {
        
        //For floating button for tweet
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets) {tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                    
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("TweetIcon")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 28,height: 28)
                    .padding()
            }
            .background{Color.blue}
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

