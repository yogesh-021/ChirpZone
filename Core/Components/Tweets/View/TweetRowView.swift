//
//  TwitterRowView.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 06/01/23.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel:TweetRowViewModel
    init(tweet:Tweet){
        self.viewModel=TweetRowViewModel(tweet:tweet)
    }
    var body: some View {
        VStack(alignment:.leading, content: {
            if let user=viewModel.tweet.user{
                HStack(alignment: .top,spacing: 12,content: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width:56,height:56)
                        
                        VStack(alignment:.leading,spacing:5,content: {
                                HStack {
                                    Text(user.fullname)
                                        .font(.subheadline).bold()

                                    Text("@\(user.username)")
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                    Text("2w")
                                        .foregroundColor(.gray)
                                        .font(.caption)
                               }
                            Text(viewModel.tweet.caption)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            
                            })
                        
                    })
                }
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }
                Spacer()
                Button {
                    viewModel.tweet.didLikeTweet ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLikeTweet ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLikeTweet ?? false ? .red : .gray)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                }

            }.foregroundColor(.gray)
            .padding()
            Divider()
        })
        .padding()
        
    }
   
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet:)
//    }
//}
