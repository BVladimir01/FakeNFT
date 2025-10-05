//
//  CartItem.swift
//  iOS-FakeNFT-Extended
//
//  Created by Симонов Иван Дмитриевич on 05.10.2025.
//

import SwiftUI

struct CartItem {
	let image: Image
	let name: String
	let rating: Int
	let price: Double
	let crncy: Currency

	var priceText: String {
		"\(String(format: "%.2f", price)) \(crncy.rawValue.uppercased())"
			.replacingOccurrences(of: ".", with: ",")
	}
}
