//
//  NFTAuthorModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 19.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import Foundation

struct NFTAuthorModel: Identifiable, Equatable {
	let id: UUID
	let name: String
	let description: String
	let nfts: [NFTModel]
	let websiteURL: URL
	let avatarURL: URL
}
