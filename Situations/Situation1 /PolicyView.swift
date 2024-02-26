//
//  File.swift
//  
//
//  Created by 권민재 on 2/23/24.

import SwiftUI

struct PolicyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let privacyPolicy = """
      Privacy Policy
      1. Collection and Use of Personal Information

      (1) Items of Personal Information Collected

      Name
      Email address
      Password
      Phone number
      Other information necessary for service use
      
      (2) Purpose of Personal Information Use
      
      - Membership registration and management
      - Service provision
      - Marketing and advertising
      
      2. Personal Information Processing and Protection

      (1) Personal Information Processing

      Our service makes every effort to securely protect your personal information.
      Personal information is stored encrypted and can only be accessed by authorized personnel.
      (2) Personal Information Protection

      Our service does not provide your personal information to third parties.
      Personal information may be provided only when required by law.
      3. Access to and Correction of Personal Information

      You can access and correct your personal information at any time through the customer center of our service.

      4. Changes to the Personal Information Processing Policy

      Our service may change the Personal Information Processing Policy, and the changed contents will be announced on the website or app of our service.

      5. Others

      Inquiries regarding this Personal Information Processing Policy can be submitted through the customer center of our service.
      """
      
      let privacyTitle = "Privacy Policy"
      let purposeText = """
(2) Purpose of Personal Information Use

  - Steal Many user information
  - Phishing,Smishing Data
  - Hacking
"""
      let remainingText = """
      1. Collection and Use of Personal Information

      (1) Items of Personal Information Collected

      Name
      Email address
      Password
      Phone number
      Other information necessary for service use
      
      2. Personal Information Processing and Protection

      (1) Personal Information Processing

      Our service makes every effort to securely protect your personal information.
      Personal information is stored encrypted and can only be accessed by authorized personnel.
      (2) Personal Information Protection

      Our service does not provide your personal information to third parties.
      Personal information may be provided only when required by law.
      3. Access to and Correction of Personal Information

      You can access and correct your personal information at any time through the customer center of our service.

      4. Changes to the Personal Information Processing Policy

      Our service may change the Personal Information Processing Policy, and the changed contents will be announced on the website or app of our service.

      5. Others

      Inquiries regarding this Personal Information Processing Policy can be submitted through the customer center of our service.
      """
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(Color.white)
                }
                .tint(Color.indigo)
                .padding(.trailing)
                .padding(20)
                .buttonStyle(.borderedProminent)
            }
            .padding(.trailing)
            
            HStack {
                HStack {
                    VStack {
                        Text("Privacy Policy")
                            .font(.system(size: 40,weight: .heavy))
                            .padding(.bottom,20)
                            .foregroundStyle(Color.black)
                        Text("We aim to steal customer information")
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.trailing,20)
                    Image("policy")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 200, height: 200)
                          .mask(
                            Circle()
                              .frame(width: 200, height: 200)
                          )
                }
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(privacyTitle)
                        .padding()
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(Color.black)
                    Text(purposeText)
                        .padding()
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                    Text("If you read this, you shouldn't sign up for membership, right?")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .fontWeight(.bold)
                        .clipShape(.capsule)
                    Text(remainingText)
                        .padding()
                        .foregroundStyle(Color.black)
                }
                .padding(20)
            }
        }
    }
    
    
    
}
#Preview {
    PolicyView()
        .sheet(isPresented: .constant(true)) {
            PolicyView()
        }
}
