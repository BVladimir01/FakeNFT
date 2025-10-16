//
//  CollectionCellModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 15.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import Foundation

struct NFTCollectionModel: Identifiable, Equatable {
    let imageURL: URL?
    let title: String
    let nftIDs: [Int]
    let description: String
    let authorID: Int
    let id: Int
}
