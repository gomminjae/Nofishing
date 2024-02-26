//
//  File.swift
//  
//
//  Created by 권민재 on 2/18/24.
//

import SwiftUI

struct XMarkView: View {
    
     @State private var drawPercentage1: CGFloat = 0
     @State private var drawPercentage2: CGFloat = 0
     @State private var drawCircle: CGFloat = 0
     
     var lineWidth: CGFloat = 8
     var markScale: CGFloat = 0.7
     
     var body: some View {
         ZStack {
             Circle()
                 .trim(from: 0, to: drawCircle)
                 .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                 .frame(width: 150 * markScale, height: 150 * markScale)
                 
             Path { path in
                 path.move(to: CGPoint(x: 50 * markScale, y: 50 * markScale))
                 path.addLine(to: CGPoint(x: 100 * markScale, y: 100 * markScale))
             }
             .trimmedPath(from: 0, to: drawPercentage1)
             .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
             .foregroundColor(.red)
             
             Path { path in
                 path.move(to: CGPoint(x: 100 * markScale, y: 50 * markScale))
                 path.addLine(to: CGPoint(x: 50 * markScale, y: 100 * markScale))
             }
             .trimmedPath(from: 0, to: drawPercentage2)
             .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
             .foregroundColor(.red)
         }
         .foregroundColor(.red)
         .frame(width: 150 * markScale, height: 150 * markScale)
         .onAppear {
             withAnimation(Animation.easeInOut(duration: 1.0)) {
                 drawCircle = 1
             }
             withAnimation(Animation.easeInOut(duration: 1.5).delay(1.0)) {
                 drawPercentage1 = 1
             }
             withAnimation(Animation.easeInOut(duration: 1.5).delay(2.0)) {
                 drawPercentage2 = 1
             }
         }
     }
}
#Preview {
    XMarkView()
}
