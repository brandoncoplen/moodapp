//
//  ContentView.swift
//  MoodApp
//
//  Created by Brandon Coplen on 8/25/25.
//

import SwiftUI
import SwiftData

struct FeedItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    // Tab selection
    enum Tab: Int { case home, feed, map, connect }
    @State private var selectedTab: Tab = .home

    // Placeholder feed data
    let feedItems: [FeedItem] = [
        FeedItem(title: "Finance / Education", subtitle: "Video Title 1"),
        FeedItem(title: "Finance / Education", subtitle: "Video Title 2"),
        FeedItem(title: "Finance / Education", subtitle: "Video Title 3")
    ]

    // Tab bar height constant
    private let tabBarHeight: CGFloat = 60

    // Helper for tab Bar icons
    private func tabBarIcon(_ systemName: String, selected: Bool = false) -> some View {
        Image(systemName: systemName + (selected ? ".fill" : ""))
            .font(.title2)
            .foregroundColor(selected ? .accentColor : .gray)
    }

    // Helper for subtitle text
    private var subtitleText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE h a"
        return formatter.string(from: Date())
    }

    @State private var tiktokAuthCode: String? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    VStack(alignment: .leading, spacing: 0) {
                        // Header
                        Text("MoodMap")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top, 32)
                            .padding(.horizontal)

                        // Subtitle (weekday, time, category)
                        Text(subtitleText)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.top, 4)
                        Text("Finance / Education")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.bottom, 16)

                        // Feed - fixed height for each card so all fit above tab bar
                        VStack(spacing: 16) {
                            ForEach(feedItems) { item in
                                Button(action: {
                                    // Action for video button
                                }) {
                                    HStack(spacing: 12) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 60, height: 40)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(item.subtitle)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                            Text(item.title)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Image(systemName: "music.note") // Placeholder for TikTok icon
                                            .font(.title2)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 120)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.4)))
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, tabBarHeight)
                        Spacer(minLength: 0)
                    }
                case .feed:
                    MoodFeedView()
                        .padding(.bottom, tabBarHeight)
                case .map:
                    WeeklyMoodMapView()
                        .padding(.bottom, tabBarHeight)
                case .connect:
                    ConnectAccountsView()
                        .padding(.bottom, tabBarHeight)
                }
            }
            // Custom Tab Bar (fixed at bottom, not overlapped)
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Button(action: { selectedTab = .home }) {
                        tabBarIcon("house", selected: selectedTab == .home)
                    }
                    Spacer()
                    Button(action: { selectedTab = .feed }) {
                        tabBarIcon("square.grid.2x2", selected: selectedTab == .feed)
                    }
                    Spacer()
                    Button(action: { selectedTab = .map }) {
                        tabBarIcon("clock", selected: selectedTab == .map)
                    }
                    Spacer()
                    Button(action: { selectedTab = .connect }) {
                        tabBarIcon("person.crop.circle.badge.plus", selected: selectedTab == .connect)
                    }
                }
                .frame(height: tabBarHeight)
                .padding(.horizontal)
                .background(Color(.systemGray6))
            }
        }
        .onOpenURL { url in
            // Handle TikTok OAuth redirect
            if url.scheme == "moodapp", url.host == "tiktok-oauth" {
                if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                   let code = components.queryItems?.first(where: { $0.name == "code" })?.value {
                    tiktokAuthCode = code
                    // For now, print the code for debugging
                    print("TikTok OAuth code: \(code)")
                    // TODO: Exchange code for access token
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
