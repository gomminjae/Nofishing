//
//  File.swift
//  
//
//  Created by 권민재 on 2/26/24.
//
import SwiftUI

struct Intro5View: View {
    
    let messages = [
        Message(content: "Let me give you another example of a different type of messenger phishing.", isCurrentUser: false),
        Message(content: "Okay :)", isCurrentUser: true)
    ]
    @State private var showingMessages = false
    @State private var isNavigationActive = false
    @State var completeMessage = false
    
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
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
                                    
                                    withAnimation {
                                        showingMessages = true
                                    }
                                }
                            }
                        }
                        
                    }
                    NavigationLink {
                        Situatuon2_2View()
                    } label: {
                        NextButton()
                    }
                }
                
            }
        }
    }
}

#Preview {
    Intro5View()
}

