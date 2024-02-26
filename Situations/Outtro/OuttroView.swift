//
//  File.swift
//  
//
//  Created by 권민재 on 2/22/24.
//
import SwiftUI

struct OutroView: View {
    
    
    @State var messages = MessageData.outroMessage
    @State private var showingMessages = false
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationStack {
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
                        CompleteView()
                    } label: {
                        Text("Getting a present🎁")
                            .foregroundStyle(Color.white)
                        
                    }
                    .modifier(MyButtonModifier())
                    .opacity(showingMessages ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showingMessages)
                }
            }
        }
    }
}

extension MessageData {
    
    static let outroMessage: [Message] = [
        Message(content: "So far, we've learned about messenger phishing and privacy policies. Isn't it easy?", isCurrentUser: false),
        Message(content: "Yes, now I think I'm invincible about phishing haha:)", isCurrentUser: true),
        Message(content: "But be careful about phishing because it's always about our loopholes", isCurrentUser: false),
        Message(content: "Yes, I will never get phishing!",isCurrentUser: true),
        Message(content: "Okay, let's wrap this up. I'll give you a present since you learned it well", isCurrentUser: false)
        
        
        
    ]
}
