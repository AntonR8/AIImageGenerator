//
//  LaunchScreenView.swift
//  EffectiveMobileToDoList
//
//  Created by Антон Разгуляев on 30.08.2024.
//

import SwiftUI
import AppTrackingTransparency

struct LaunchScreen: View {
    @State var movement = false
    @State var size: CGFloat = 50

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .accentColor], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            Text("")
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation(.linear(duration: 1)) {
                            movement = true
                        }
                    }
                }

            if movement {
                Image("appicon")
                    .resizable()
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                            withAnimation {
                                size = 150
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            withAnimation {
                                movement = false

                            }
                        }

                    }
                    .onDisappear {
                        allowATT() 
                    }
            }
        }
    }

    func allowATT() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized: print("Authorized")
//                print(ASIdentifierManager.shared().advertisingIdentifier)
            case .denied: print("Denied")
            case .notDetermined: print("Not Determined")
            case .restricted: print("Restricted")
            @unknown default: print("Unknown")
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
