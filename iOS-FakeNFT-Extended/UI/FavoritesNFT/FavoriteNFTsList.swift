//
//  FavoriteNFTsList.swift
//  iOS-FakeNFT-Extended
//
//  Created by Hajime4life on 18.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import SwiftUI

struct FavoriteNFTsList: View {
    @State private var showContextMenu: Bool = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 7),
                GridItem(.flexible(), spacing: 7)
            ], spacing: 20) {
                ForEach(1..<7) { _ in
                    FavoriteNFTCell()
                }
            }
            .padding(20)
        }
        .navigationTitle("Мои NFT")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(.chevronLeft)
                }
                .foregroundColor(.ypBlack)
            }
        }
        .background(Color.ypWhite)
    }
}

#Preview {
    NavigationView {
        LightDarkPreviewWrapper {
            NavigationLink(destination: FavoriteNFTsList()) {
                Text("Test")
            }
        }
    }
}
