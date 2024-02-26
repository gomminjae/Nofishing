//
//  File.swift
//  
//
//  Created by 권민재 on 2/15/24.
//
import SwiftUI

struct Situation1View: View {
    
    @State private var opacities = Array(repeating: 0.0, count: 4)
    @State private var fontSize = CGFloat(20)
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    
                    ZStack {
                        HStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Hello! Fish")
                                    .foregroundColor(Color.black)
                                    .lineSpacing(10)
                                    .opacity(opacities[0])
                                    .onAppear {
                                        fontSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                        withAnimation(.easeIn) {
                                            self.opacities[0] = 1.0
                                        }
                                    }
                                Text("**We have a many problem**")
                                foregroundColor(Color.black)
                                    .lineSpacing(10)
                                    .opacity(opacities[1])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(1)) {
                                            self.opacities[1] = 1.0
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Situation1View()
}
