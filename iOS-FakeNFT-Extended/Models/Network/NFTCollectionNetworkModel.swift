//
//  NFTCollectionNetworkModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 15.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import Foundation

struct NFTCollectionNetworkModel: Identifiable, Decodable {

    let id: Int
    let title: String
    let createdAt: Date
    let coverURLString: String
    let nftIDs: [Int]
    let description: String
    let authorID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case createdAt
        case coverURLString = "cover"
        case nftIDs = "nfts"
        case description
        case authorID = "author"
    }
}
