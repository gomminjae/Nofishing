//
//  File.swift
//  
//
//  Created by 권민재 on 2/13/24.
//

import Combine
import SwiftUI

struct Situation2_1View: View {
    
    @State var messages = MessageData.linkgMessages
    @State var newMessage: String = ""
    @State private var showingMessages = false
    
    @State private var opacities = Array(repeating: 0.0, count: 4)
    @State private var textSize = CGFloat(20)
    
     
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background image
                Image("ipadbackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    VStack(spacing: 20) {
                        ForEach(messages.indices, id: \.self) { index in
                            MessageView(currentMessage: messages[index])
                                .opacity(showingMessages && index < messages.count ? 1 : 0)
                                .offset(y: showingMessages && index < messages.count ? 0 : -100)
                                .animation(.easeInOut(duration: 0.5).delay(Double(index) * 7))
                                .opacity(0.7)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading,50)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showingMessages = true
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    Situation2_1View()
}
