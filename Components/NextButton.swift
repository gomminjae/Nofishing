//
//  File.swift
//  
//
//  Created by 권민재 on 2/23/24.
//

import SwiftUI

struct NextButton: View {
    var fontSize = CGFloat(30)
    var body: some View {
        HStack {
            Text("NEXT")
                .font(.system(size: 20,weight: .bold))
                .foregroundColor(Color.black)

            Image(systemName: "arrowtriangle.forward.fill")
                .font(.system(size: fontSize,weight: .regular))
                .foregroundStyle(Color.indigo)
        }
        .padding(20)
        .padding(.bottom,30)
    }
}

#Preview {
    NextButton(fontSize: 20)
}
