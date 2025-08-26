import SwiftUI

struct MoodFeedView: View {
    var body: some View {
        VStack {
            Text("Mood Feed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 32)
            Spacer()
        }
    }
}

#Preview {
    MoodFeedView()
}
