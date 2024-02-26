//
//  File.swift
//  Nofishing
//
//  Created by 권민재 on 2/17/24.
//

import SwiftUI

struct CheckMarkView: View {
    
    @State private var drawPercentage1: CGFloat = 0
    @State private var drawPercentage2: CGFloat = 0
    @State private var drawCircle: CGFloat = 0
    
    var lineWidth: CGFloat = 8
    var markScale: CGFloat = 0.7
    
    var body: some View {
        ZStack {
            Group {
                Path { path in
                    path.move(to: CGPoint(x: 70 * markScale, y: 60 * markScale))
                    path.addLine(to: CGPoint(x: 100 * markScale, y: 100 * markScale))
                }
                .trimmedPath(from: 0, to: drawPercentage1)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                
                Path { path in
                    path.move(to: CGPoint(x: 100 * markScale, y: 100 * markScale))
                    path.addLine(to: CGPoint(x: 155 * markScale, y: 10 * markScale))
                }
                .trimmedPath(from: 0, to: drawPercentage2)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            }
            .offset(x: -40 * markScale, y: 5 * markScale)
            Circle()
                .trim(from: 0, to: drawCircle)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-50))
        }
        .foregroundColor(.green)
        .frame(width: 50 * markScale, height: 100 * markScale)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5)) {
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

#Preview("Checkmark") {
    CheckMarkView()
}
