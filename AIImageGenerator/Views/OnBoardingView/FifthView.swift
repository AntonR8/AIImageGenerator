//
//  FifthView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct FifthView: View {
    @EnvironmentObject var vm: ViewModel
    @State var notificationsRrequested = false
    var body: some View {
        OnboardingView(
            title: "Stay Updated with the Latest Features!",
            description: "Turn on notifications for updates and tips",
            image: "fifth"
        )
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    Button {
                        withAnimation {
                            vm.firstLaunch = false
                        }
                    } label: {
                        CapsuleButton(buttonTitle: "Turn on Notofocations")
                            .frame(width: UIScreen.main.bounds.width - 32)
                    }
                    .disabled(!notificationsRrequested)
                    .onTapGesture {
                        vm.requestAuthorization()
                        notificationsRrequested = true
                    }
                    Button {
                            vm.firstLaunch = false
                    } label: {
                        Text("Skip")
                            .foregroundStyle(.secondary)
                    }


                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    NavigationStack {
        FifthView()
            .environmentObject(ViewModel())
    }
}
