//
//  File.swift
//  
//
//  Created by 권민재 on 2/9/24.
//

import SwiftUI

struct Situation1WarningView: View {
    @Environment(\.dismiss) private var dismiss
    
    let message = Message(content: "Didn't I tell you earlier that you have to read the privacy policy before signing up?", isCurrentUser: false)
    var body: some View {
        VStack {
            XMarkView()
                .foregroundColor(.red)
            Text("Warning!!!")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(Color.red)
            MessageView(currentMessage: message)
            Button("I checked") {
                dismiss()
            }
            .background(Color.indigo)
            .font(.system(size: 30,weight: .bold))
            .foregroundStyle(Color.white)
            .modifier(MyButtonModifier())
        }
        .padding(20)
    }
}



#Preview("WarningView") {
    Situation1WarningView()
}
