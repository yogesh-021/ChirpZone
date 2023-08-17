//
//  SideMenuRowViw.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import SwiftUI

struct SideMenuRowView: View{

    
    //let viewModel: SideMenuViewModel
    private var name:String
    private var test:String
    init(name:String,test:String){
        self.name=name
        self.test=test
    }

    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: name)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(test)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height:40)
        .padding(.horizontal)
    }
}

//struct SideMenuRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuRowView(viewModel: .profile)
//    }
//}
