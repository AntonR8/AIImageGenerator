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
    let pricePerPeriod: String
    let bestOffer: Bool
    let subscription: ApphudProduct?

    var body: some View {

            HStack() {
                Image(systemName: vm.chosenSubscription == subscription ? "checkmark.circle.fill" : "circle")
                VStack(alignment: .leading) {
                    Group {
                        Text(subscription == vm.products[2] ? "Monthly" : "Yearly") + Text(" · $").foregroundStyle(.secondary) + Text(pricePerPeriod).foregroundStyle(.secondary)
                    }
                    .font(.caption)
                    HStack {
                        Text("$") + Text(price.description)
                        if bestOffer {
                            BestOfferBadgeView()
                        }
                    }
                    .padding(.vertical, -4)
                }
                .foregroundStyle(.white)


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

#Preview {
    SuscriptionButton(price: 19.99, pricePerPeriod: "3.33 / month", bestOffer: true, subscription: nil)
        .environmentObject(ViewModel())
}


