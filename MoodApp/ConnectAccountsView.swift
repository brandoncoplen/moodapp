import SwiftUI

struct ConnectAccountsView: View {
    @AppStorage("instagramConnected") private var instagramConnected: Bool = false
    @AppStorage("tiktokConnected") private var tiktokConnected: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            Text("Connect Accounts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 32)

            Button(action: {
                instagramConnected = true // Stub: Replace with real OAuth
            }) {
                HStack {
                    Image(systemName: "camera")
                        .foregroundColor(.purple)
                    Text(instagramConnected ? "Instagram Connected" : "Connect Instagram")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).stroke(instagramConnected ? Color.purple : Color.gray.opacity(0.4), lineWidth: 2))
            }

            Button(action: {
                tiktokConnected = true // Stub: Replace with real OAuth
            }) {
                HStack {
                    Image(systemName: "music.note")
                        .foregroundColor(.pink)
                    Text(tiktokConnected ? "TikTok Connected" : "Connect TikTok")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).stroke(tiktokConnected ? Color.pink : Color.gray.opacity(0.4), lineWidth: 2))
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ConnectAccountsView()
}
