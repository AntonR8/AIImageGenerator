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
//                vm.chosenSubscription = monthly
            }, label: {
                SuscriptionButton(price: 19.99, bestOffer: false, subscription: "monthly")
            })
            .padding(.vertical, 8)
            Button(action: {
//                vm.chosenSubscription = yearly
            }, label: {
                SuscriptionButton(price: 39.99, bestOffer: true, subscription: "yearly")
            })
        }
    }
}

#Preview {
    SubscriptionsOptionsView()
        .environmentObject(ViewModel())
}
