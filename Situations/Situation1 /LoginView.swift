//
//  File.swift
//  
//
//  Created by 권민재 on 2/9/24.
//
import SwiftUI



struct LoginView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var id: String = ""
    @State private var isEditingId = false
    @State private var isCustomViewVisible = false
    @State private var address: String = ""
    @State private var cardNumber: String = ""
    @State private var cardCvv1: String = ""
    @State private var cardCvv2: String = ""
    @State var showSheet: Bool = false
    @State var showPolicy = false
    @State var showCorrect = false
    
    @State var isCorrect = false
    
    @State private var showingAlert = false
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Before you study")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("Please write the information")
                        .font(.title2)
                }
                .padding(.bottom, 20)
                .padding(.trailing,40)
                Image("fishing")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 200, height: 200)
                      .mask(
                        Circle()
                          .frame(width: 200, height: 200)
                      )
            }
            .frame(height: 300)
            
            TextField("Please enter your name", text: $name)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Please enter your email", text: $email)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Please enter your id", text: $id, onEditingChanged: { editing in
                isEditingId = editing
                if editing {
                    isCustomViewVisible = true
                }
            })
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            .sheet(isPresented: $isCustomViewVisible) {
                Situation1WarningView()
                    .frame(height: 700)
            }
            
            
            TextField("Please enter your address", text: $address, onEditingChanged: { editing in
                isEditingId = editing
                if editing {
                    isCustomViewVisible = true
                }
            })
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            TextField("Please enter your card number", text: $cardNumber, onEditingChanged: { editing in
                isEditingId = editing
                if editing {
                    isCustomViewVisible = true
                }
            })
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Button("privacy policy") {
                    showPolicy.toggle()
                }
                .modifier(MyButtonModifier())
                .fullScreenCover(isPresented: $showPolicy) {
                    PolicyView()
                }
                //.background(Color.indigo)
                .font(.title)
                .frame(width: 200,height: 70)
                .foregroundStyle(Color.white)
                .padding(.trailing,20)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    print("Cancel button tapped")
                    showCorrect.toggle()
                }
                .sheet(isPresented: $showCorrect) {
                    //Correct1View(isCorrect: $isCorrect)
                    NavigationStack {
                        Correct1View()
                    }
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                
                Button("Sign UP") {
                    print("Sign up button tapped")
                    showingAlert = true
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(10)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Please read a privacy policy!!😡"), message: Text("read"), dismissButton: .default(Text("OK")))
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
}


#Preview {
    LoginView()
}
