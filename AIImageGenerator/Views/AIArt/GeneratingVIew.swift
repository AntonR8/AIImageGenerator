//
//  GeneratingVIew.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct GeneratingVIew: View {
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        ZStack {
            background
            VStack {
                closeButton
                Spacer()
                if !vm.requestError {
                    percentCircle
                    if !vm.proSubscriptionBought {
                        title
                        message
                    }
                } else {
                    errorScreen
                }

                Spacer()
                add
            }
        }
        .onAppear(perform: {

            vm.completed = 100
            vm.startTimer()
        })
    }



}


extension GeneratingVIew {
    var background: some View {
        LinearGradient(colors: [.black, .accent], startPoint: .bottom, endPoint: .top)
            .opacity(0.2)
            .ignoresSafeArea()
    }

    var closeButton: some View {
        HStack {
            Spacer()
            Button(action: {
                vm.isGenerating = false
            }, label: {
                SmallImageButton(systemName: "xmark", foregroundStyle: .white, backGroundStyle: .black)
            })
        }
        .padding()
    }

    var percentCircle: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.4), lineWidth: 8)
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat((100-vm.completed)/100))
                .stroke(.accent, style: StrokeStyle(lineWidth: 8))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 10)
            Text("\(Int(100-vm.completed))%")
                .font(.custom("SF Mono", size: 35))
                .bold()
        }
        .padding(.horizontal ,100)
    }

    var title: some View {
        Text("Generating your image")
            .font(.title3)
            .bold()
            .padding(10)
    }

    var message: some View {
        Text("Hold it open and wait for the image to be created. It may take up to a minute to generate.")
            .multilineTextAlignment(.center)
            .font(.callout)
            .padding(.horizontal)
    }


    var add: some View {
        VStack {
            Text("You want to go faster?")
            ProButtonView(title: "Upgrade to Pro")
        }
    }

    var errorScreen: some View {
        VStack {
            Image(systemName: "exclamationmark.brakesignal")
                .font(.largeTitle)
            Text("OOPS!")
                .font(.headline)
                .foregroundStyle(.secondary)
                .padding()
            Text("Looks like something is wrong with your prompt, try to change it")
                .multilineTextAlignment(.center)
        }
        .padding(25)
    }
}




#Preview {
    GeneratingVIew()
            .environmentObject(ViewModel())
}
