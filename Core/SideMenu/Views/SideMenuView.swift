//
//  SideMenuView.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View{
    @State private var showProfileView=false
    @EnvironmentObject var authViewModel:AuthViewModel
    var body: some View {
       if let user=authViewModel.currentUser{
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                
                Button {
                    showProfileView.toggle()
                } label: {
                    SideMenuRowView(name: "person", test: "Profile")
                }
                .fullScreenCover(isPresented: $showProfileView) {
                    ProfileView(user: user)
                }
                
                SideMenuRowView(name: "list.bullet", test: "Lists")
                
                SideMenuRowView(name: "bookmark", test: "Bookmarks")
                
                
                Button {
                    authViewModel.signOut()
                } label: {
                    SideMenuRowView(name: "arrow.left.square", test: "Logout")
                }
                
    //            if pleaseLogout == true{
    //
    //            }
    //            .fullScreenCover(isPresented: $showProfileView) {
    //                ProfileView()
    //            }
                
                
    //            ForEach(SideMenuViewModel.allCases, id:\.rawValue) { option in
    //                if option == .profile{
    //                    NavigationLink {
    //                        ProfileView()
    //                    } label: {
    //                        SideMenuRowView(viewModel: option)
    //                    }
    //                }
    //                else if option == .logout{
    //                    authViewModel.logout()
    //
    //                }
    //                else{
    //
    //                    SideMenuRowView(viewModel: option)
    //                }
    //            }
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthViewModel())
    }
}


