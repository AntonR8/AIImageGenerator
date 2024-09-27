//
//  StartView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 16.09.2024.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var opacity: CGFloat = 1
    @AppStorage("firstRun") var firstRun = true

    var body: some View {
        ZStack {
            if vm.firstLaunch {
                FirstView()
            } else if vm.firstLaunchPaywall {
                PaywallView()
            } else {
                MainView()
            }

//            EmptyView().sheet(isPresented: $firstRun, content: {
//                PaywallView()
//            })
            LaunchScreen()
                .opacity(opacity)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeOut(duration: 1)) {
                            opacity = 0
                        }
                    }
                }
        }

    }
}

#Preview {
    StartView()
        .environmentObject(ViewModel())
}
