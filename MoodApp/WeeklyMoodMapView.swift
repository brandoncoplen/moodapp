import SwiftUI

struct WeeklyMoodMapView: View {
    var body: some View {
        VStack {
            Text("Weekly Mood Map")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 32)
            Spacer()
        }
    }
}

#Preview {
    WeeklyMoodMapView()
}
