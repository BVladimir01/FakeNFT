//
//  NavigationMenuButton.swift
//  iOS-FakeNFT-Extended
//
//  Created by Алина on 11.10.2025.
//
import SwiftUI

struct NavigationMenuButton: ToolbarContent {

    let icon: String
    let defaultColor: Color = .ypBlack

    var action: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: action) {
                Image(icon)
                    .foregroundColor(defaultColor)
            }
        }
    }
}

#Preview {
    NavigationStack {
        Text("Preview NavigationMenuButton")
            .toolbar {
                NavigationMenuButton(icon: "sort") {
                    print("Asset tapped")
                }
            }
            .toolbar {
                NavigationMenuButton(icon: "square_and_pencil") {
                    print("Asset tapped")
                }
            }
    }
    .padding()
}
