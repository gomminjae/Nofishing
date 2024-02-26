//
//  File.swift
//  
//
//  Created by 권민재 on 2/25/24.
//

import SwiftUI

struct Situatuon2_2View: View {
    
    @State var messages = MessageData.messengerPhishing
    @State var newMessage: String = ""
    @State private var showingMessages = false
    
    @State private var showingAlert = false
    @State private var showCorrect = false
     
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
                                .animation(.easeInOut(duration: 0.5).delay(Double(index) * 2))
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
                    //Spacer()
                    HStack(spacing: 20) {
                        Button("phishing") {
                            print("Hello")
                            showCorrect.toggle()
                        }
                        .modifier(MyButtonModifier())
                        .font(.system(size:30,weight: .bold))
                        .foregroundStyle(Color.white)
                        .fullScreenCover(isPresented: $showCorrect) {
                            Correct2View()
                        }
                        Button("No Phishing") {
                            print("Hello")
                            showingAlert = true
                        }
                        .modifier(MyButtonModifier())
                        .font(.system(size:30,weight: .bold))
                        .foregroundStyle(Color.white)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Think again."), message: Text("My child? is asking for bank information."), dismissButton: .default(Text("OK")))
                        }
                    
                    }
                    .padding(.top,90)
                }
            }
        }
    }
}

#Preview {
    Situatuon2_2View()
}
