//
//  AITextEditor.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct AITextEditor: View {
    @Binding var bindingTextFieldVar: String
    let promptPlaceholder: String

    var body: some View {
        TextEditor(text: $bindingTextFieldVar)
            .accentColor(.white)
            .scrollContentBackground(.hidden)
            .padding(8)
            .frame(height: 144)
            .background(.tertiary.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .overlay {
                RoundedRectangle(cornerRadius: 25.0).stroke(.accent, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .overlay {
                HStack{
                    if bindingTextFieldVar.isEmpty {
                        VStack {
                            Text(promptPlaceholder)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: {
                            bindingTextFieldVar = ""
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(.white)
                        })
                    }
                }
                .padding()
            }

    }
}

#Preview {
    AITextEditor(bindingTextFieldVar: .constant(""), promptPlaceholder: "What do you want to generate?")
}
