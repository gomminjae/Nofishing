//
//  File.swift
//  
//
//  Created by 권민재 on 2/13/24.
//

import SwiftUI


struct MessageView: View {
    
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isCurrentUser {
                Image("fisher")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            if currentMessage.linkMessage != "" {
                MessageCell(contentMessage: currentMessage.content, isCurrentUser: currentMessage.isCurrentUser, linkMessage: currentMessage.linkMessage)
            } else {
                MessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: false,linkMessage: "www.messafe.com"))
}
