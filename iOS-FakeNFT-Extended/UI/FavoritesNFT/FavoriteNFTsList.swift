//
//  FavoriteNFTsList.swift
//  iOS-FakeNFT-Extended
//
//  Created by Hajime4life on 18.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import SwiftUI

struct FavoriteNFTsList: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ProfileViewModel
    var body: some View {
        ScrollView {
            if let likedNfts = viewModel.likedNfts { // TODO: Заменить на стейт
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 7),
                    GridItem(.flexible(), spacing: 7)
                ], spacing: 20) {
                    ForEach(likedNfts) { nft in
                        FavoriteNFTCell(nft: nft) {
                            // TODO: тап на лайк
                        }
                    }
                }
                .padding(20)
            } else { // TODO: Заменить на стейт + LoadingView()
                ProgressView()
            }
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
        .frame(maxWidth: .infinity)
        .background(Color.ypWhite)
        .task {
            await viewModel.loadLikedNFTs()
        }
        .alert("Ошибка", isPresented: .constant(viewModel.errorMessage != nil), actions: {
            Button("Отмена", role: .cancel) {
                viewModel.clearError()
            }
            Button("Повторить") {
                Task {
                    await viewModel.loadLikedNFTs()
                }
            }
        }, message: {
            Text(viewModel.errorMessage ?? "Не удалось получить данные")
        })
    }
}

#Preview {
    NavigationView {
        LightDarkPreviewWrapper {
            NavigationLink(
                destination: FavoriteNFTsList(
                    viewModel: ProfileViewModel(
                        profileService: ProfileServiceImpl(
                            networkClient: DefaultNetworkClient()
                        ),
                        nftsService: NftServiceImpl(
                            networkClient: DefaultNetworkClient(),
                            storage: NftStorageImpl()
                        )
                    )
                )
            ) {
                Text("Test")
            }
        }
    }
}
