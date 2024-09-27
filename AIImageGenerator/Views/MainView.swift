//
//  ContentView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var vm: ViewModel
    @State var path: [String] = []
   

    var body: some View {
        NavigationStack(path: $vm.path) {

            TabView(selection: $vm.tabSelection,
                    content: {
                AIArtView()
                    .tabItem {
                        Image(systemName: "sparkles")
                        Text("AI Art")
                    }
                    .tag(1)
//                RemoveBGView()
//                    .navigationTitle("Remove BG")
//                    .tabItem {
//                        Text("Remove BG")
//                        Image(systemName: "eraser.line.dashed")
//                    }
//                    .tag(2)
                ExploreView()
                    .tabItem {
                        Text("Explore")
                        Image(systemName: "square.grid.2x2")
                    }
                    .tag(3)
                SavedView()
                    .tabItem {
                        Text("Saved")
                        Image(systemName: "heart.square")
                    }
                    .tag(4)
            })
            .toolbar {
                if !vm.proSubscriptionBought {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            vm.showSubscriptionSheet = true
                        } label: {
                            ProButtonView()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationTitle(vm.returnNavigationTitle())
            .navigationDestination(for: String.self) { _ in
                SelectResultView()
            }
            .fullScreenCover(isPresented: $vm.showSubscriptionSheet) {
                PaywallView()
            }
        }
        .preferredColorScheme(.dark)

    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
