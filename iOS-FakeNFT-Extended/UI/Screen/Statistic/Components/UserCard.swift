//
//  UserCard.swift
//  iOS-FakeNFT-Extended
//
//  Created by Алина on 18.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//
import SwiftUI

struct UserCard: View {

    enum Constants {
        static let titleButton = "Перейти на сайт пользователя"
        static let safeTop: CGFloat = 20
        static let safeLeading: CGFloat = 16
        static let containerSpacing: CGFloat = 41
        static let bioSpacing: CGFloat = 28
        static let profileLineLimit: Int = 4
        static let profileLineSpacing: CGFloat = 5
        static let profileTrailingFix: CGFloat = 2
        static let bioTrailing: CGFloat = 16
        static let buttonMinHeight: CGFloat = 44
    }

    let user: User
    let action: () -> Void

    var body: some View {
        VStack(spacing: Constants.containerSpacing) {
            bioContent
            contentButton
        }
        .safeAreaPadding(.top, Constants.safeTop)
        .safeAreaPadding(.leading, Constants.safeLeading)
    }

    private var bioContent: some View {
        VStack(spacing: Constants.bioSpacing) {
            ProfileInfo(user: user)
                .lineLimit(Constants.profileLineLimit)
                .lineSpacing(Constants.profileLineSpacing)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.trailing, Constants.profileTrailingFix)
            OpenWebsiteButton(
                title: Constants.titleButton,
                font: Font(UIFont.caption1),
                textColor: .ypBlack,
                color: Color(.systemBackground),
                action: action)
        }
        .padding(.trailing, Constants.bioTrailing)
    }

    private var contentButton: some View {
        List {
            NFTCollectionRow(user: MockData.users[7]) .listRowSeparator(.hidden)
        }
            .listStyle(.plain)
            .frame(maxWidth: .infinity)
    }
}

#Preview("Light") {
    NavigationStack {
        UserCard(user: MockData.users[7], action: { })
            .tint(.ypBlack)
            .scrollContentBackground(.hidden)
            .preferredColorScheme(.light)
    }
}

#Preview("Dark") {
    NavigationStack {
        UserCard(user: MockData.users[7], action: { })
            .tint(.ypBlack)
            .scrollContentBackground(.hidden)
            .preferredColorScheme(.dark)
    }
}
