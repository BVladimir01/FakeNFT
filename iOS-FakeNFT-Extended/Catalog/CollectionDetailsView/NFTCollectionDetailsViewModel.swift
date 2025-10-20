//
//  NFTCollectionDetailsViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 19.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import SwiftUI

@Observable
@MainActor
final class NFTCollectionDetailsViewModel {

	private let collectionDetailsService: any NFTCollectionDetailsServiceProtocol
	private let coordinator: any CatalogCoordinatorProtocol

	let collection: NFTCollectionModel
	var author: NFTUserModel?
	var nfts: [NFTModel] = []
	var hasError = false
	var isLoading = false

	private var state: State = .empty {
		didSet {
			hasError = false
			isLoading = false
			UIBlockingProgressHUD.dismiss()
			switch state {
			case .empty:
				author = nil
				nfts = []
			case .loading:
				isLoading = true
				UIBlockingProgressHUD.show()
			case .error:
				hasError = true
			case .loaded:
				break
			}
		}
	}

	init(
		collection: NFTCollectionModel,
		collectionDetailsService: any NFTCollectionDetailsServiceProtocol,
		coordinator: any CatalogCoordinatorProtocol
	) {
		self.collection = collection
		self.collectionDetailsService = collectionDetailsService
		self.coordinator = coordinator
		updateDetails()
	}

	func updateDetails() {
		Task {
			do {
				guard state != .loading else { return }
				state = .loading
				async let author = try collectionDetailsService.fetchAuthor()
				async let nfts = try collectionDetailsService.fetchNFTs()
				self.author = try await author
				self.nfts = try await nfts
				state = .loaded
			} catch {
				state = .error
			}
		}
	}

	func authorTapped() {
		guard let url = author?.websiteURL else { return }
		coordinator.showWebView(for: url)
	}

	func favoriteTapped(for nft: NFTModel) {
		Task {
			do {
				guard state != .loading,
					  let index = nfts.firstIndex(where: { $0.id == nft.id })
				else {
					return
				}
				state = .loading
				try await collectionDetailsService.updateFavoriteStatus(for: nft)
				self.nfts[index].isFavourite.toggle()
				state = .loaded
			}
		}
	}

	func cartTapped(for nft: NFTModel) {
		Task {
			do {
				guard state != .loading,
					  let index = nfts.firstIndex(where: { $0.id == nft.id })
				else {
					return
				}
				state = .loading
				try await collectionDetailsService.updateFavoriteStatus(for: nft)
				nfts[index].isAddedToCart.toggle()
				state = .loaded
			}
		}
	}

}

private extension NFTCollectionDetailsViewModel {
	enum State: Equatable {
		case empty, loading, error, loaded
	}
}
