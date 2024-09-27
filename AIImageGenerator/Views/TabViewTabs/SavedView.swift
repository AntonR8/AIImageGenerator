//
//  SavedView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        ScrollView {
            HardCodeGridView(arrayOfImages: vm.savedHardCodeImages)
            AsyncImageGridView(arrayOfImages: vm.savedAssyncImages)
            if vm.savedAssyncImages.isEmpty && vm.savedHardCodeImages.isEmpty {
                emptyScreen
            }
        }
        .padding()
        .navigationTitle("Saved")
        
    }
}

#Preview {
    NavigationStack {
        SavedView()
            .environmentObject(ViewModel())
    }
}


extension SavedView {
    var emptyScreen: some View {
        VStack {
            Image(systemName: "photo.stack")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text("Your collection is empty")
                .font(.title3)
                .bold()
                .padding(10)
            Text("Create your first image and tap the heart on the one you like")
                .font(.footnote)
                .multilineTextAlignment(.center)
            Button(action: {
                vm.tabSelection = 1
            }, label: {
                CapsuleButton(imageSystemName: "sparkles", buttonTitle: "Create")
            })
            .padding()
            Spacer()
        }
        .padding(40)
    }
}

