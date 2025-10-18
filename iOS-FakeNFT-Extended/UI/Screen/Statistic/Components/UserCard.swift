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
    }

    let user: User
    let action: () -> Void

    var body: some View {
        VStack {
            ProfileInfo(user: user)
            OpenWebsiteButton(title: Constants.titleButton, font: Font(UIFont.caption1),
                              textColor: .ypBlack, color: .ypWhite, action: action)
        }
    }
}

#Preview {
    let action = { print("Tapped button") }
    return UserCard(user: MockData.users[7], action: action)
}
