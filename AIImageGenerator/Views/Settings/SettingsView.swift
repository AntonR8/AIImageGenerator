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
    let appStoreLink = URL(string:"https://www.AppStore.com")!

    var body: some View {
        VStack {
            List {
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
                        Label(
                            title: { Text("Rate our app") },
                            icon: { Image(systemName: "star.bubble") }
                        )
                    }
                    ShareLink(item: appStoreLink) {
                        Label(
                            title: { Text("Share with friends") },
                            icon: { Image(systemName: "square.and.arrow.up") }
                        )
                    }
                    HStack {
                            Label(
                                title: { Text("Notifications") },
                                icon: { Image(systemName: "bell.badge") }
                            )
                        Spacer()
                        Toggle("", isOn: $vm.notificationsTurnedON)
                    }
                    Link(destination: contactURL, label: {
                        Label(
                            title: { Text("Contact us") },
                            icon: { Image(systemName: "envelope") }
                        )
                    })
                }

                Section {
                    Link(destination: termsOfUseURL, label: {
                        Label(
                            title: { Text("Usage Policy") },
                            icon: { Image(systemName: "doc.text") }
                        )
                    })
                    Link(destination: termsOfUseURL, label: {
                        Label(
                            title: { Text("Privacy Policy") },
                            icon: { Image(systemName: "lock.shield") }
                        )
                    })
                }

            }
            .frame(maxHeight: 450)
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


            Text("App Version: 1.0.0")
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(ViewModel())
    }
}
