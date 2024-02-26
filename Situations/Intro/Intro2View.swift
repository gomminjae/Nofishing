//
//  File.swift
//
//
//  Created by 권민재 on 2/24/24.
//
import SwiftUI


struct Intro2View: View {
    
    @State var messages = MessageData.privacyPolicyMessage
    @State private var showingMessages = false
    @State var isShowPolicy = false
    @State var completeMessage = false
    
    @State private var showingAlert = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.white)
                        .ignoresSafeArea()
                    VStack {
                        HStack(spacing: 30) {
//                            Image("fisher")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 150, height: 150)
//                                .mask(
//                                    Circle()
//                                        .frame(width: 150, height: 150))
//                            
//                            Text("Privacy Policy")
//                                .font(.system(size: 40,weight: .bold))
                            Spacer()
                            Button(action: {
                                print("hello")
                                isShowPolicy = true
                                //showingAlert = true
                            }) {
                                Image(systemName: "doc.fill")
                            }
                            //.frame(width: 150,height: 80)
                            .background(Color.indigo)
                            .tint(Color.white)
                            .font(.system(size: 30,weight: .bold))
                            .padding(.trailing,30)
                            .sheet(isPresented: $isShowPolicy) {
                                ExamplePolicyView()
                                    .onDisappear {
                                        completeMessage = true
                                    }
                            }
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        VStack {
                            Image("privacy")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width)

                            Text("image by freepik")
                            
                        }
                        .padding(10)
                    }
                    
                }
                ZStack {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(alignment: .leading) {
                                ForEach(messages.indices, id: \.self) { index in
                                    if completeMessage || (index != 3 && index != 4 && index != 5) {
                                        MessageView(currentMessage: messages[index])
                                            .opacity(showingMessages && index < messages.count ? 1 : 0)
                                            .offset(y: showingMessages && index < messages.count ? 0 : -100)
                                            .animation(Animation.easeInOut(duration: 0.5).delay(Double(index) * 1.5))
                                            .onAppear {
                                                DispatchQueue.main.async {
                                                    withAnimation {
                                                        proxy.scrollTo(index, anchor: .top) // 각 MessageView가 나타날 때마다 해당 MessageView로 스크롤
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    proxy.scrollTo(2)
                                }
                            }
                            withAnimation(.easeInOut(duration: 1.5)) {
                                showingMessages = true
                            }
                            
                        }
                        .onDisappear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    proxy.scrollTo(4)
                                    
                                }
                            }
                            
                        }
                    }
                }
                NavigationLink {
                    LoginView()
                } label: {
                    NextButton()
                }
                .onTapGesture {
                    if !isShowPolicy {
                        showingAlert = true
                    } else {
                        showingAlert = false
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("알림"), message: Text("메시지를 완료해야 다음 단계로 진행할 수 있습니다."))
                }
            }
        }
    }
}

#Preview {
    Intro2View()
}
