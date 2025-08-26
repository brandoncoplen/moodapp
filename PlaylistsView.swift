import SwiftUI

struct PlaylistsView: View {
    var body: some View {
        VStack {
            Text("Playlists / Packs")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 32)
            Spacer()
        }
    }
}

#Preview {
    PlaylistsView()
}
