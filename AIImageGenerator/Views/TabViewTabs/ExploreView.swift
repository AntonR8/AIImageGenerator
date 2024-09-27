//
//  ExploreView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var vm: ViewModel

    var body: some View {

        ScrollView {
            Text("Find AI generated images")
                .font(.title3)
                .bold()
                .padding(.vertical, 50)
            HardCodeGridView(arrayOfImages: vm.hardCodeImages)

        }
        .padding(.top, 0.10001)
        .navigationTitle("Explore")
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
