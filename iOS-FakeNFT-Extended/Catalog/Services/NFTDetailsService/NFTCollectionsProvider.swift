//
//  NFTCollectionsProvider.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 15.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import Foundation

protocol NFTCollectionsProviderProtocol: Sendable {
	func fetch(number: Int, sorting: CollectionsSortingType) async throws -> [NFTCollectionModel]
}

actor NFTCollectionsMockProvider: NFTCollectionsProviderProtocol {

	let throwsError: Bool

    private let nftCollections: [NFTCollectionModel] = [
		.init(
			id: UUID(uuidString: "d4fea6b6-91f1-45ce-9745-55431e69ef5c")!,
			title: "singulis epicuri",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Brown.png")!,
			nftIDs: [
				UUID(uuidString: "c14cf3bc-7470-4eec-8a42-5eaa65f4053c")!,
				UUID(uuidString: "d6a02bd1-1255-46cd-815b-656174c1d9c0")!,
				UUID(uuidString: "f380f245-0264-4b42-8e7e-c4486e237504")!
			],
			description: "curabitur feugait a definitiones singulis movet eros aeque mucius evertitur assueverit et eam",
			authorName: "Some name",
			authorWebsite: URL(string: "https://priceless_leavitt.fakenfts.org/")
		),
		.init(
			id: UUID(uuidString: "014a175d-c546-405c-8944-d694e4a1a47f")!,
			title: "Pink",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Pink.png")!,
			nftIDs: [
				UUID(uuidString: "9810d484-c3fc-49e8-bc73-f5e602c36b40")!,
				UUID(uuidString: "e8c1f0b6-5caf-4f65-8e5b-12f4bcb29efb")!
			],
			description: "suscipiantur alienum ad habitant venenatis rhoncus maximus impetus elaboraret scripta disputationi esse quot aliquid",
			authorName: "Barry Sheppard",
			authorWebsite: URL(string: "https://affectionate_bassi.fakenfts.org/")
		),
		.init(
			id: UUID(uuidString: "81268b05-db02-4bc9-b0b0-f7136de49706")!,
			title: "unum reque",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/White.png")!,
			nftIDs: [
				UUID(uuidString: "82570704-14ac-4679-9436-050f4a32a8a0")!,
				UUID(uuidString: "e33e18d5-4fc2-466d-b651-028f78d771b8")!
			],
			description: "dictas singulis placerat interdum maximus referrentur partiendo explicari verear molestiae",
			authorName: "Darren Morris",
			authorWebsite: URL(string: "https://sharp_matsumoto.fakenfts.org/")
		)
    ]

	init(throwsError: Bool = false) {
		self.throwsError = throwsError
	}

	func fetch(number: Int, sorting: CollectionsSortingType) async throws -> [NFTCollectionModel] {
        try? await Task.sleep(for: .seconds(3))
		if throwsError {
			throw NetworkClientError.urlSessionError
		} else {
			return (0..<number)
				.map { _ in nftCollections.randomElement()! }
				.sorted(by: sorting.sortingRule)
		}
    }

}
