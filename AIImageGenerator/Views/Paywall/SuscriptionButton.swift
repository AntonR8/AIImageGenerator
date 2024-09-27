//
//  SuscriptionButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct SuscriptionButton: View {
    @EnvironmentObject var vm: ViewModel
    var price: Double
    let bestOffer: Bool
    let subscription: String

    var body: some View {
        HStack() {
            Image(systemName: "checkmark.circle.fill")
            VStack(alignment: .leading) {
                Group {
                    Text(subscription == "monthly" ? "Monthly" : "Yearly") + Text(" · $").foregroundStyle(.secondary) + Text(price.description).foregroundStyle(.secondary)
                }
                .font(.caption)
                Text("$") + Text((String(format: "%.2f",
                                         subscription == "monthly" ? price/4-0.01 : price/21.385))) + Text(" / week")
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
            Capsule().stroke(vm.chosenSubscription != nil ? .accent : .clear)
        }
    }
}

#Preview {
    SuscriptionButton(price: 19.99, bestOffer: true, subscription: "monthly")
        .environmentObject(ViewModel())
}


