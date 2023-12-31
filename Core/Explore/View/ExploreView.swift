//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 07/01/23.
//

import SwiftUI

struct ExploreView: View {
    //@ObservedObject var viewModel=ExploreViewModel()
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0...25, id: \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
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
