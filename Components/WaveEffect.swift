//
//  File.swift
//  
//
//  Created by 권민재 on 2/24/24.
//
import SwiftUI

struct Wave: Shape {

  var offset: Angle
  var percent: Double
  var width: CGFloat 

  var animatableData: Double {
    get { offset.degrees }
    set { offset = Angle(degrees: newValue) }
  }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let waveHeight = 0.035 * rect.height
        let yoffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        path.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        // 루프 조건 변경: 뷰 너비 끝까지 반복
        for angle in stride(from: startAngle.degrees, to: endAngle.degrees + 0.001, by: 10) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * width
            path.addLine(to: CGPoint(x: x, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        // 오른쪽 끝 지점 명시적으로 추가
        path.addLine(to: CGPoint(x: width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }

}

struct WaveEffect: View {

  @State private var percent = 30.0
  @State private var waveOffset = Angle(degrees: 0)
  @State private var waveOffset2 = Angle(degrees: 180)

  var body: some View {
    GeometryReader { geometry in
      VStack {
        ZStack(alignment: .center) {
          Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: percent / 100.0, width: geometry.size.width)
            .fill(Color.blue)
            .frame(height: geometry.size.height)
          Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: percent / 100.0, width: geometry.size.width)
            .fill(Color.blue)
            .opacity(0.5)
            .frame(height: geometry.size.height)
        }
      }
      .padding()
      .onAppear {
        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
          self.waveOffset = Angle(degrees: 360)
          self.waveOffset2 = Angle(degrees: -180)
        }
      }
    }
  }
}

#Preview {
  WaveEffect()
}

