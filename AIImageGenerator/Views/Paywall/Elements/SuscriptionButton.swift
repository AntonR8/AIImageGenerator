//
//  SuscriptionButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import ApphudSDK
import StoreKit

struct SuscriptionButton: View {
    @EnvironmentObject var vm: ViewModel
    var price: Double
    let bestOffer: Bool
    let subscription: Product

    var body: some View { 
        HStack() {
            Image(systemName: vm.chosenSubscription == subscription ? "checkmark.circle.fill" : "circle")
            VStack(alignment: .leading) {
                Group {
                    Text(subscription == vm.products[1] ? "Monthly" : "Yearly") + Text(" · $").foregroundStyle(.secondary) + Text(price.description).foregroundStyle(.secondary)
                }
                .font(.caption)
                Text("$") + Text((String(format: "%.2f",
                                         subscription == vm.products[1]  ? price/4-0.01 : price/21.385))) + Text(" / week")
            }
            .foregroundStyle(.white)
            if bestOffer {
                BestOfferBadgeView()
            }

            Spacer()
            Divider()
                .frame(height: 30)
            VStack {
                Text("3 days")
                Text("free")
            }
            .foregroundStyle(.accent)
            .font(.caption)
        }
        .padding(8)
        .padding(.horizontal, 8)
        .background(.gray.opacity(0.3))
        .clipShape(Capsule())
        .overlay {
            Capsule().stroke(vm.chosenSubscription == subscription ? .accent : .clear)
        }
    }
}

//#Preview {
//    SuscriptionButton(price: 19.99, bestOffer: true, subscription: .monthly)
//        .environmentObject(ViewModel())
//}


