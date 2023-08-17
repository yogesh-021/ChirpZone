//
//  NewTweetView.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption=""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel:AuthViewModel
    @ObservedObject var viewModel=UploadTweetViewModel()
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()

                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()

            HStack(alignment: .top){
                if let user=authViewModel.currentUser{
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    TextField("What's happening...", text: $caption, axis: .vertical)
                }
            }
            .padding()
            Spacer()
        }
        .onReceive(viewModel.$didUploadTweeet) { success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}


