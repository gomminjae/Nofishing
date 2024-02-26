//
//  File.swift
//  
//
//  Created by 권민재 on 2/26/24.
//
import SwiftUI

struct CompleteView: View {
    
    var body: some View {
        VStack {
            Text("There's no such thing as a free lunch.")
                .font(.system(size: 40,weight: .bold))
                .padding(.bottom,20)
            Image("complete")
                .resizable()
        }
    }
}
