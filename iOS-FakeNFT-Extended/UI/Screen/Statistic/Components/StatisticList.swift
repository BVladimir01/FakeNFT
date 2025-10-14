//
//  StatisticList.swift
//  iOS-FakeNFT-Extended
//
//  Created by Алина on 11.10.2025.
//
import SwiftUI

struct StatisticList: View {

    enum SortOption: String, CaseIterable {
        case byName
        case byRating
    }

    let users = MockData.users
    let sortOption: SortOption

    var body: some View {
        List {
            ForEach(Array(sortedUsers.enumerated()), id: \.1.id) { index, user in
                UserRatingCell(ranking: index + 1, user: user)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .safeAreaPadding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
        .animation(.easeInOut, value: sortOption)
    }

    private var sortedUsers: [User] {
        switch sortOption {
            case .byName:
                return users.sorted { $0.name < $1.name }
            case .byRating:
                return users.sorted { $0.ratingValue > $1.ratingValue }
        }
    }
}

#Preview("By Rating") {
    StatisticList(sortOption: .byRating)
}

#Preview("By Name") {
    StatisticList(sortOption: .byName)
}
