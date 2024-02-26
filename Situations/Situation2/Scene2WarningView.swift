//
//  File.swift
//  
//
//  Created by 권민재 on 2/9/24.
//

import SwiftUI

struct Scene2WarningView: View {
    
    @Environment(\.dismiss) private var dismiss
    let messages = MessageData.messengerExample
    @State private var showingMessages = false
    @State private var showNext = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    XMarkView()
                    Text("Warning!!!")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundStyle(Color.red)
                }
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(messages.indices, id: \.self) { index in
                        MessageView(currentMessage: messages[index])
                            .opacity(showingMessages && index < messages.count ? 1 : 0)
                            .offset(y: showingMessages && index < messages.count ? 0 : -100)
                            .animation(.easeInOut(duration: 0.5).delay(Double(index) * 1.5))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(maxWidth: .infinity)
                .onAppear {
                    withAnimation {
                        showingMessages = true
                    }
                    
                }
                
                NavigationStack {
                    Button("Next") {
                        showNext = true
                    }
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .fullScreenCover(isPresented: $showNext) {
                        Intro3View()
                    }
                    .modifier(MyButtonModifier())
                    .background(Color.indigo)
                }
            }
            .padding(20)
        }
    }
}



struct MyButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 50)
            .background(Color.indigo)
            .cornerRadius(10)
    }
}






extension MessageData {
    
    static let messengerExample: [Message] = [
        Message(content: "You just got a messenger phishing!", isCurrentUser: false),
        Message(content: "I pressed it because they told me to", isCurrentUser: true),
        Message(content: "That's what messenger phishing is about.",isCurrentUser: false),
        Message(content: "Smishing attacks typically involve sending fake text messages disguised as official institutions  services to users, aiming to obtain personal information or financial gain", isCurrentUser: false),
        Message(content: "or services to users, aiming to obtain personal information or financial gain", isCurrentUser: false),
        Message(content: "oh my god😡", isCurrentUser: true),
        Message(content: "Now, let's learn about message phishing", isCurrentUser: false)
        
    ]
}

#Preview {
    Scene2WarningView()
}

