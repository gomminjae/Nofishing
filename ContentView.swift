
import SwiftUI

struct ContentView: View {
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack(spacing: geo.size.height * 0.1) {
                    ZStack {
                        Image("fisher")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .mask(
                                    Circle()
                                        .frame(width: 300, height: 300)
                            )
                    }
                    Text("No Fishing🎣")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                    
                    
                    Text("Let's study smishing to protect money and assets")
                        .font(.system(size: 30))
                    NavigationLink {
                        Intro1View()
                    } label: {
                        HStack(spacing: 20) {
                            Image(systemName: "cursorarrow.click")
                                .font(.system(size: 30))
                            Text("Let's go")
                                .font(.system(size: 30,weight: .bold))
                        }
                    }
                    .frame(width: geo.size.width * 0.5, height: geo.size.width * 0.1)
                    .foregroundColor(Color.white)
                    .background {
                        Capsule()
                            .foregroundColor(Color.indigo)
                    }
                    Text("all images by freepik")
                    
                }
            }
            .preferredColorScheme(.light)
        }
    }
}

