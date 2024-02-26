//
//  File.swift
//  
//
//  Created by 권민재 on 2/23/24.
//
import SwiftUI


struct Correct1View: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var showNext = false
    //@Binding var isCorrect: Bool
    let message = Message(content: "If possible, you should avoid signing up for sites that ask for sensitive personal information such as social security numbers or credit card information.", isCurrentUser: false)
    let message2 = Message(content: "Don't forget to check the privacy policy!", isCurrentUser: false)
    
    var body: some View {
        VStack {
            CheckMarkView()
                .padding(.bottom,20)
            Text("Correct!!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.green)
                .padding(.bottom,40)
            MessageView(currentMessage: message)
                .animation(.easeOut(duration: 0.5))
            MessageView(currentMessage: message2)
                .animation(.easeOut(duration: 0.5))
        
            NavigationStack {
                Button("Next") {
                    showNext = true
                }
                .modifier(MyButtonModifier())
                .fullScreenCover(isPresented: $showNext) {
                    Situation2_1View()
                }
                .foregroundStyle(Color.white)
                .background(Color.indigo)

            }
            
        }
        
    }
}

#Preview {
    Correct1View()
}


