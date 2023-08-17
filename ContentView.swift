//
//  ContentView.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 09/08/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu=false
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil{
                LoginView()
            }
            else{
                //have a user logged in
                mainInterfaceView
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}


extension ContentView{
    var mainInterfaceView:some View{
        ZStack(alignment: .leading) {
            MainTabView()
                .navigationBarHidden(showMenu)
        
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(0.25)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user=viewModel.currentUser{
                    Button {
                        withAnimation(.easeOut){
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32,height: 32)
                    }
                }

            }
        }
        .onAppear{
            showMenu=false
        }
    }
}
