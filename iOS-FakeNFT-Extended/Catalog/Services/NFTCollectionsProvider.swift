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

	let throwsError: Bool

    private let nftCollections: [NFTCollectionModel] = [
		.init(
			id: UUID(),
			title: "singulis epicuri",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Brown.png")!,
			nftIDs: Array(repeating: UUID(), count: 3),
			description: "curabitur ...",
			authorID: UUID()
		),
		.init(
			id: UUID(),
			title: "Beige",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Beige.png")!,
			nftIDs: Array(repeating: UUID(), count: 4),
			description: "A series of ...",
			authorID: UUID()
		),
		.init(
			id: UUID(),
			title: "unum reque",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/White.png")!,
			nftIDs: Array(repeating: UUID(), count: 2),
			description: "dictas ...",
			authorID: UUID()
		)
    ]

	init(throwsError: Bool = false) {
		self.throwsError = throwsError
	}

	func fetch(number: Int) async throws -> [NFTCollectionModel] {
        try? await Task.sleep(for: .seconds(3))
		if throwsError {
			throw NetworkClientError.urlSessionError
		} else {
			return (0..<number).map { _ in
				let baseCollection = nftCollections.randomElement()!
				return NFTCollectionModel(
					id: UUID(),
					title: baseCollection.title,
					imageURL: baseCollection.imageURL,
					nftIDs: baseCollection.nftIDs,
					description: baseCollection.description,
					authorID: baseCollection.authorID
				)
			}
		}
    }

}
