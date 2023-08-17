//
//  ProfilePhotoSelectorView.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 11/08/23.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @State private var selectedImage:[PhotosPickerItem]=[]
    @State private var isImageSelected=false
    @State var data:Data?
    @EnvironmentObject var viewModel:AuthViewModel
    var body: some View {
       VStack {
               
            
                AuthHeaderView(title1: "Setup Account",
                               title2: "Add a profile photo.")
                
                PhotosPicker(selection: $selectedImage,
                                 maxSelectionCount: 1,
                             matching: .images) {
                    
                    //To display selected photo
                    if let data=data,let uiImage=UIImage(data:data){
                        VStack {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180,height: 230)
                                .padding(.top,44)
                            .clipShape(Circle())
                            
                            
                            
                            Button {
                                viewModel.uploadProfileImage(uiImage)
                            } label: {
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 340,height: 50)
                                    .background{ Color(.systemBlue) }
                                    .clipShape(Capsule())
                                    .padding()
                            }
                            .shadow(color:.gray.opacity(0.5),radius: 10)
                        }
                        

                    }
                    
                    
                    
                    //To select from library
                    else{
                        Image("addProfile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180,height: 180)
                            .padding()
                        
                    }}
                .onChange(of: selectedImage){newValue in
                             guard let item=selectedImage.first else{
                                 return
                             }
                             item.loadTransferable(type: Data.self) { result in
                                 switch result{
                                 case.success(let data):
                                     if let data=data{
                                         self.data=data
                                         isImageSelected.toggle()
                                     }else{
                                         print("Data is nil")
                                     }
                                 case.failure(let failure):
                                     fatalError("\(failure)")
                                 }
                             }
                                
                         }
        
//                .sheet(isPresented: $isImageSelected) {
//                    if let data=data,let uiImage=UIImage(data:data)
//                       {
//                           Image(uiImage: uiImage)
//                               .resizable()
//                       }
//                }

            Spacer()
        }.ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
