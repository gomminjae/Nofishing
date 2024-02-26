//
//  File.swift
//  
//
//  Created by 권민재 on 2/25/24.
//

import SwiftUI


struct Intro3View: View {
    
    @State var messages = MessageData.explainPhshing
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
}

extension MessageData {
    static let explainPhshing: [Message] = [
        Message(content: "Message phishing is an attack that leaks personal information or causes financial damage through text messages on a mobile phone.", isCurrentUser: false),
        Message(content: "Attackers send text messages to victims under the guise of a bank, institution, or close acquaintances, and induce them to click links, enter personal information, and install apps.", isCurrentUser: false),
        Message(content: "Oh no, if the link I just clicked was actually a smishing link, then that was a wrong move.", isCurrentUser: true),
        Message(content: "You should ignore links or app installation messages from unknown numbers.", isCurrentUser: false)
        
        
    ]
        
    
}


#Preview {
    Intro3View()
}
