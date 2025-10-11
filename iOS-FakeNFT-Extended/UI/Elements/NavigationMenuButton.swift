//
//  NavigationMenuButton.swift
//  iOS-FakeNFT-Extended
//
//  Created by Алина on 11.10.2025.
//
import SwiftUI

struct NavigationMenuButton: View {

    enum Constants {
        static let defaultIconSize: CGFloat = 24
        static let defaultButtonSize: CGFloat = 42
        static let defaultColor: Color = .ypBlack
    }

    let icon: String
    var color: Color = Constants.defaultColor
    var iconSize: CGFloat = Constants.defaultIconSize
    var buttonSize: CGFloat = Constants.defaultButtonSize

    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(color)
                .frame(width: iconSize, height: iconSize)
        }
        .frame(width: buttonSize, height: buttonSize)
        .contentShape(Rectangle())
    }
}

#Preview {
    VStack(spacing: 20) {
        NavigationMenuButton(icon: "text_left") {
            print("Asset tapped")
        }

        NavigationMenuButton(icon: "square_and_pencil") {
            print("Asset tapped")
        }
    }
    .padding()
}
