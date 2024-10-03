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
        VStack {
            Button(action: {
                vm.chosenSubscription = vm.products[1]
            }, label: {
                SuscriptionButton(price: 19.99, bestOffer: false, subscription: vm.products[1])
            })
            .padding(.vertical, 8)
            Button(action: {
                vm.chosenSubscription = vm.products[0]
            }, label: {
                SuscriptionButton(price: 39.99, bestOffer: true, subscription: vm.products[0])
            })
        }
    }
}

#Preview {
    SubscriptionsOptionsView()
        .environmentObject(ViewModel())
}
