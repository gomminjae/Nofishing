//
//  File.swift
//  
//
//  Created by 권민재 on 2/26/24.
//
import SwiftUI

struct GiftEventView: View {
    
    @State var messages = MessageData.robotext
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        proxy.scrollTo(3)
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
                    Intro4View()
                } label: {
                    NextButton()
                }
                
            }
        }
    }
}

#Preview {
    GiftEventView()
}


