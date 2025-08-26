import SwiftUI

struct PlaylistItem: Identifiable {
    let id = UUID()
    let title: String
}

struct PlaylistsView: View {
    let playlists: [PlaylistItem] = [
        PlaylistItem(title: "Morning News Shot"),
        PlaylistItem(title: "Midweek Money Moves"),
        PlaylistItem(title: "Weekend Laugh Pack")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Playlists")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 32)
                .padding(.horizontal)

            Spacer(minLength: 16)

            VStack(spacing: 20) {
                ForEach(playlists) { playlist in
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)
                        Text(playlist.title)
                            .font(.title3)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.4)))
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    PlaylistsView()
}
