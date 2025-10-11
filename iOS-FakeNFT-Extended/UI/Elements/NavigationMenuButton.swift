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

    enum IconType {
        case asset(String)
        case system(String)
    }

    let icon: IconType
    var color: Color = Constants.defaultColor
    var iconSize: CGFloat = Constants.defaultIconSize
    var buttonSize: CGFloat = Constants.defaultButtonSize

    var action: () -> Void

    var body: some View {
        Button(action: action) {
            imageView
                .scaledToFit()
                .foregroundColor(color)
                .frame(width: iconSize, height: iconSize)
        }
        .frame(width: buttonSize, height: buttonSize)
        .contentShape(Rectangle())
    }

    @ViewBuilder
    private var imageView: some View {
        switch icon {
            case .asset(let name):
                Image(name)
                    .resizable()
            case .system(let systemName):
                Image(systemName: systemName)
                    .resizable()
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        NavigationMenuButton(icon: .asset("text_left")) {
            print("Asset tapped")
        }

        NavigationMenuButton(icon: .system("square.and.pencil")) {
            print("SF Symbol tapped")
        }
    }
    .padding()
}
