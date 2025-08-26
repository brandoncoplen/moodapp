import SwiftUI

struct ConnectAccountsView: View {
    @AppStorage("instagramConnected") private var instagramConnected: Bool = false
    @AppStorage("tiktokConnected") private var tiktokConnected: Bool = false

    // TikTok OAuth constants (replace with your actual values)
    private let tiktokClientKey = "YOUR_CLIENT_KEY"
    private let tiktokRedirectURI = "moodapp://tiktok-oauth"
    private let tiktokScope = "user.info.basic"
    private let tiktokState = "moodapp123"

    var tiktokOAuthURL: URL? {
        let urlString = "https://www.tiktok.com/v2/auth/authorize/?client_key=\(tiktokClientKey)&response_type=code&scope=\(tiktokScope)&redirect_uri=\(tiktokRedirectURI)&state=\(tiktokState)"
        return URL(string: urlString)
    }

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

            if let url = tiktokOAuthURL {
                Link(destination: url) {
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
            }

            // TODO: Handle redirect from TikTok OAuth
            // - Extract the authorization code from the redirect URI
            // - Exchange the code for an access token using TikTok's API
            // - Store the access token securely
            // - Fetch user data using the access token

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ConnectAccountsView()
}
