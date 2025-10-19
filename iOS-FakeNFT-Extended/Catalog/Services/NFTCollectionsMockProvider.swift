//
//  NFTCollectionsProvider.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 15.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import Foundation

protocol NFTCollectionsProviderProtocol: Sendable {
    func fetch(number: Int) async throws -> [NFTCollectionModel]
}

actor NFTCollectionsMockProvider: NFTCollectionsProviderProtocol {

	private static let mockNFT = NFTModel(
		id: UUID(),
		name: "Myrna Cervantes",
		imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/1.png")!,
		rating: 5,
		price: 39.37,
		currency: .eth
	)

	private static let mockAuthor = NFTUserModel(
		id: UUID(),
		name: "Jimmie Reilly",
		description: "daddsd",
		nfts: [],
		websiteURL: URL(string: "https://student7.students.practicum.org")!,
		avatarURL: URL(string: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/594.jpg")!
	)

    private let nftCollections: [NFTCollectionModel] = [
		.init(
			id: UUID(),
			title: "singulis epicuri",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Brown.png")!,
			nfts: Array(repeating: mockNFT, count: 3),
			description: "curabitur ...",
			author: mockAuthor
		),
		.init(
			id: UUID(),
			title: "Beige",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Beige.png")!,
			nfts: Array(repeating: mockNFT, count: 4),
			description: "A series of ...",
			author: mockAuthor
		),
		.init(
			id: UUID(),
			title: "unum reque",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/White.png")!,
			nfts: Array(repeating: mockNFT, count: 2),
			description: "dictas ...",
			author: mockAuthor
		)
    ]

	func fetch(number: Int) async throws -> [NFTCollectionModel] {
        try? await Task.sleep(for: .seconds(3))
		return (0..<number).map { _ in nftCollections.randomElement()! }
    }

}
