//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 07/01/23.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel=ExploreViewModel()
    @State private var showProfileView=false
    @State private var searchedText=""
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text:$searchedText )
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.searchableUser) { user in
//                            NavigationLink {
//                                ProfileView(user:user)
//                            } label: {
//                                UserRowView(user: user)
//                            }
                            Button {
                                showProfileView.toggle()
                            } label: {
                                UserRowView(user: user)
                            }
                            .fullScreenCover(isPresented: $showProfileView) {
                                ProfileView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
