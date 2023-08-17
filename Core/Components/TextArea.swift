//
//  TextArea.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                TextField(placeholder, text: $text)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .disableAutocorrection(true)
//                Text(placeholder)
                    
            }
//            TextEditor(text: $text)
//                .padding(4)
//                .disableAutocorrection(true)
        }
        .font(.body)
    }
}
