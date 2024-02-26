//
//  File.swift
//  
//
//  Created by 권민재 on 2/24/24.
//

import SwiftUI

struct Intro1View: View {
    
    
    @State var messages = MessageData.introMessages
    @State private var showingMessages = false
    @State private var isNavigationActive = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.clear)
                    Image("fisher")
                        .resizable()
                        .background(Color.clear)
                    WaveEffect()
                        .padding(.bottom, 0)
                }
                .ignoresSafeArea()
                .padding(20)
                .frame(height: geo.size.height / 2)
                
                
                ZStack {
                    ScrollViewReader { proxy in
                        ScrollView {
                        
                            VStack(alignment: .leading) {
                                ForEach(messages.indices, id: \.self) { index in
                                    MessageView(currentMessage: messages[index])
                                        .opacity(showingMessages && index < messages.count ? 1 : 0)
                                        .offset(y: showingMessages && index < messages.count ? 0 : -100)
                                        .animation(.easeInOut(duration: 0.5).delay(Double(index) * 1.5))
                                    
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation {
                                        proxy.scrollTo(5)
                                    }
                                }
                                withAnimation {
                                    showingMessages = true
                                }
                            }
                        }
                    }
                    
                }
                NavigationLink {
                    Intro2View()
                } label: {
                    NextButton()
                        
                }
                .opacity(showingMessages ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: showingMessages)
            }
        }
        .onChange(of: showingMessages) { newValue in
            if newValue {
               
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(messages.count) * 2 + 1) {
                    isNavigationActive = true
                }
            }
        }
    }
}




#Preview {
    Intro1View()
}
