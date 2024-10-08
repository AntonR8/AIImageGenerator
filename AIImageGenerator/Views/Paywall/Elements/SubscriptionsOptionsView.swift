//
//  SubscriptionsOptionsView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct SubscriptionsOptionsView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        if vm.products.isEmpty {
            Text("⚠️ no Internet connection")
        } else {
            VStack {
                Button(action: {
                    vm.chosenSubscription = vm.products[2]
                }, label: {
                    SuscriptionButton(
                        price: 19.99,
                        pricePerPeriod: "4.99/week",
                        bestOffer: false,
                        subscription: vm.products.isEmpty ? nil : vm.products[2])
                })
                .padding(.vertical, 8)
                Button(action: {
                    vm.chosenSubscription = vm.products[0]
                }, label: {
                    SuscriptionButton(price: 39.99, pricePerPeriod: "3.33/month", bestOffer: true, subscription: vm.products.isEmpty ? nil : vm.products[0])
                })
            }
        }
    }
}

#Preview {
    SubscriptionsOptionsView()
        .environmentObject(ViewModel())
}
