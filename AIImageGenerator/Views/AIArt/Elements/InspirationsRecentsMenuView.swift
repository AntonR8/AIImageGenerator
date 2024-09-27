//
//  InspirationsRecentsMenuView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct InspirationsRecentsMenuView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        HStack {
            Spacer()
            InspirationsRecentsMenuColumnView(title: "Inspirations", inspirationChosen: true)
            InspirationsRecentsMenuColumnView(title: "Recents", inspirationChosen: false)
            Spacer()
        }

    }
}

#Preview {
    InspirationsRecentsMenuView()
        .environmentObject(ViewModel())
}


