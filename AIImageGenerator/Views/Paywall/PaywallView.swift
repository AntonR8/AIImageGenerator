//
//  PaywallView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import ApphudSDK

struct PaywallView: View {
    @EnvironmentObject var vm: ViewModel
   
    

    var body: some View {
        ZStack {
            backGround
            VStack {
                topButtons
                Spacer()
                LogoAndAdvantagesView()
                SubscriptionsOptionsView()
                Spacer()
                button
                PrivacyPolicyLinksView()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationStack{
        PaywallView()
            .environmentObject(ViewModel())
    }
}


extension PaywallView {
    var backGround: some View {
        VStack {
            Image("paywall")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .ignoresSafeArea()
        .overlay {
            VStack {
                Spacer()
                LinearGradient(colors: [.black, .black, .clear], startPoint: .bottom, endPoint: .top)
            }
        }
    }

    var topButtons: some View {
        HStack {
            Button {
                vm.firstLaunchPaywall = false
                vm.showSubscriptionSheet = false
            } label: {
                SmallImageButton(systemName: "xmark", foregroundStyle: .white, backGroundStyle: .black.opacity(0.5))
            }
            Spacer()
            Button {
                Task {await Apphud.restorePurchases()}
            } label: {
                SmallImageButton(title: "Restore", foregroundStyle: .white, backGroundStyle: .black.opacity(0.5))
            }

        }
    }

    var button: some View {
        Button {
            vm.makePurchase(product: vm.chosenSubscription)
        } label: {
            CapsuleButton(buttonTitle: "Continue")
        }
        .padding(.vertical)
    }
}
