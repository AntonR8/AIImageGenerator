//
//  SettingsView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI
import ApphudSDK

struct SettingsView: View {
    @EnvironmentObject var vm: ViewModel
    @Environment(\.requestReview) var requestReview
    let contactURL = URL(string:"mailto:cihangultekiin@hotmail.com")!
    let termsOfUseURL =  URL(string: "https://www.termsfeed.com/live/bbc6cbdc-1b4f-463c-9d61-dd3acb21a3b9")!
    let appStoreLink = URL(string:"https://apps.apple.com/us/app/art-image-creator/id6711346469")!

    var body: some View {
            List {
                Text("")
                    .frame(height: 100)
                    .listRowBackground(Color.clear)

                if !vm.proSubscriptionBought {
                    Section {
                        Button {
                            Task {
                                await Apphud.restorePurchases()
                            }
                        } label: {
                            Label(
                                title: { Text("Restore purchases") },
                                icon: { Image(systemName: "arrow.counterclockwise") }
                            )
                        }
                    }
                }

                Section {
                    Button {
                        requestReview()
                    } label: {
                        MenuElementView(image: "star.bubble", title: "Rate our app")
                    }
                    ShareLink(item: appStoreLink) {
                        MenuElementView(image: "square.and.arrow.up", title: "Share with friends")
                    }
                    HStack {
                        MenuElementView(image: "bell.badge", title: "Notifications", noChevron: true)
                        Spacer()
                        Toggle("", isOn: $vm.notificationsTurnedON)
                    }
                    Link(destination: contactURL, label: {
                        MenuElementView(image: "envelope", title: "Contact us")
                    })
                }

                Section {
                    Link(destination: termsOfUseURL, label: {
                        MenuElementView(image: "doc.text", title: "Usage Policy")
                    })
                    Link(destination: termsOfUseURL, label: {
                        MenuElementView(image: "lock.shield", title: "Privacy Policy")
                    })
                    AppVersionView()
                        .listRowBackground(Color.clear)
                }

            }

            .foregroundStyle(.primary)
            .navigationTitle("Settings")
            .toolbar {
                if !vm.proSubscriptionBought {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            vm.showSubscriptionSheet = true
                        }, label: {
                            ProButtonView()
                        })
                    }
                }
            }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(ViewModel())
    }
}
