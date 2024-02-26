//
//  File.swift
//  
//
//  Created by 권민재 on 2/9/24.
//

import SwiftUI
import UIKit

struct MessageCell: View {
    
    var contentMessage: String
    var isCurrentUser: Bool
    var linkMessage: String?
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text(contentMessage)
                .font(.system(size: 25,weight: .semibold))
            if linkMessage != "" {
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text(linkMessage ?? "")
                        .foregroundStyle(.blue)
                        .font(.system(size: 30))
                }
                .fullScreenCover(isPresented: $showSheet) {
                    Scene2WarningView()
                }
//                .sheet(isPresented: $showSheet) {
//                    Scene2WarningView()
//                }
            }
        }
        .padding(10)
        .foregroundColor(isCurrentUser ? Color.white : Color.black)
        .background(isCurrentUser ? Color.blue : Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
    
    
}


#Preview("Message View"){
    MessageCell(contentMessage: "This is a single message cell.", isCurrentUser: false,linkMessage: "www.example.com")
}
