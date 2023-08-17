//
//  CustomInputField.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import SwiftUI

struct CustomInputField: View {
    var imageName:String
    var placeholderText:String
    var isSecureField:Bool?=false
    @Binding var text:String
    var body: some View {
        VStack{
            HStack{
                Image(systemName : imageName)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false{
                    SecureField(placeholderText, text:$text).textInputAutocapitalization(.never)
                }
                else{
                    TextField(placeholderText, text:$text).textInputAutocapitalization(.never)
                }
                
                
            }
            Divider()
                .foregroundColor(Color(.darkGray))
            .padding()
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         text: .constant(""))
    }
}
