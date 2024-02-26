//
//  File.swift
//  
//
//  Created by 권민재 on 2/26/24.
//
import SwiftUI

struct Correct2View: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var showNext = false
    //@Binding var isCorrect: Bool
    let message = Message(content: "Mom, my phone is out of order. I'm in a hurry, so I just send 1 million won to my parents by impersonating my child.", isCurrentUser: false)
    let message2 = Message(content: "At this time, do not reply immediately, but make sure to call your child to check whether it is true.", isCurrentUser: false)
    let message3 = Message(content: "The basic position to prevent smishing damage is to avoid the link itself first.", isCurrentUser: false)
    let message4 = Message(content: "Most smishing is done through the link attached to the text message. When you click the link, you can install a hacking app or hack personal information. Texts from unknown numbers should not be answered or clicked on links, and text messages from family, friends, or acquaintances should not be clicked prematurely.", isCurrentUser: false)
    let message5 = Message(content: "Lastly, refrain from informing others of financial information. When other people ask for financial information in various names, it is correct to start with suspicion.", isCurrentUser: false)
    
    var body: some View {
        VStack {
            CheckMarkView()
                .padding(.bottom,20)
                .padding(.top,20)
            Text("Correct!!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.green)
                .padding(.bottom,40)
           
            MessageView(currentMessage: message)
                .animation(.easeOut(duration: 0.5))
            MessageView(currentMessage: message2)
                .animation(.easeOut(duration: 0.5))
            MessageView(currentMessage: message3)
                .animation(.easeOut(duration: 0.5))
            MessageView(currentMessage: message4)
                .animation(.easeOut(duration: 0.5))
            MessageView(currentMessage: message5)
                .animation(.easeOut(duration: 0.5))
            
            
            NavigationStack {
                Button("Next") {
                    showNext = true
                }
                .modifier(MyButtonModifier())
                .fullScreenCover(isPresented: $showNext) {
                    OutroView()
                }
                .foregroundStyle(Color.white)
                .background(Color.indigo)

            }
            
        }
        
    }
}

#Preview {
    Correct2View()
}
