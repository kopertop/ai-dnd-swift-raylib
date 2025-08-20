
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("AI D&D")
                .font(.largeTitle)
                .padding()
            
            RaylibView()
                .frame(width: 800, height: 450)
                .border(Color.gray)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
