//
//  File.swift
//  
//
//  Created by 권민재 on 2/26/24.
//
import SwiftUI



struct Intro4View: View {
    
    @State var messages = MessageData.robotext
    @State private var showingMessages = false
    @State private var isNavigationActive = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                // 상단 섹션 (WaveEffect 포함)
                ZStack {
                    HStack {
                        VStack {
                            Text("Robotext smishing")
                                .font(.system(size: 20,weight: .bold))
                            Image("robotext")
                                .resizable()
                            Text("image by www.businessinsider.com")
                        }
                        VStack {
                            Text("Robotxt category")
                                .font(.system(size: 20,weight: .bold))
                            Image("robotextgraph")
                                .resizable()
                            Text("Image by www.robokiller.com")
                        }
                        
                    }
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
                    Intro5View()
                } label: {
                    NextButton()
                }
                
            }
        }
    }
}
extension MessageData {
    static let robotext: [Message] = [
        Message(content: "Received a message containing an illegal link, as shown in the picture above.", isCurrentUser: false),
        Message(content: "They also exploit human psychology by sending text messages that are designed to appeal to our emotions. As shown in the picture above, they send messages with malicious links disguised as various topics.", isCurrentUser: false),
        Message(content: " I'm scared now. I will never click on a link in a message again.", isCurrentUser: true),
        Message(content: " Yes, I agree. It is recommended to delete such messages immediately.", isCurrentUser: false)
        
    ]
}

#Preview {
    Intro4View()
}
