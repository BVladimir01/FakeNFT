//
//  NFTCardView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 19.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import SwiftUI

struct NFTCardView: View {

	private let name: String
	private let imageURL: URL?
	private let rating: Int
	private let price: Double
	private let currency: Currency
	private let isFavorite: Bool
	private let isAddedToCart: Bool

	private let onCartTap: () -> Void
	private let onFavoriteTap: () -> Void

	private var priceString: String {
		Decimal(price)
			.formatted(.number.precision(.fractionLength(0...2)))
	}

	init(
		name: String,
		imageURL: URL?,
		rating: Int,
		price: Double,
		currency: Currency,
		isFavorite: Bool,
		isAddedToCart: Bool,
		onCartTap: @escaping () -> Void,
		onFavoriteTap: @escaping () -> Void
	) {
		self.name = name
		self.imageURL = imageURL
		self.rating = rating
		self.price = price
		self.currency = currency
		self.isFavorite = isFavorite
		self.isAddedToCart = isAddedToCart
		self.onCartTap = onCartTap
		self.onFavoriteTap = onFavoriteTap
	}

	var body: some View {
		VStack(spacing: 8) {
			nftImage
			nftDetails
		}
		.frame(height: 192)
	}

	var nftImage: some View {
		AsyncImage(url: imageURL) { phase in
			switch phase {
			case .empty:
				VStack(spacing: .zero) {
					Spacer()
					ProgressView()
						.tint(.ypBlack)
					Spacer()
				}
			case .success(let image):
				image
					.resizable()
					.scaledToFit()
					.overlay(alignment: .topTrailing) {
						Button(action: onFavoriteTap) {
							Image(isFavorite ? .active : .noActive)
								.foregroundStyle(isFavorite ? .ypURed : .ypUWhite)
						}
					}
			case .failure:
				Image(systemName: "exclamationmark.triangle.fill")
			@unknown default:
				Image(systemName: "exclamationmark.triangle.fill")
			}
		}
		.clipShape(RoundedRectangle(cornerRadius: 12))
	}

	var nftDetails: some View {
		VStack(alignment: .leading, spacing: 4) {
			RatingView(rating)
			HStack(spacing: .zero) {
				VStack(alignment: .leading, spacing: 4) {
					Group {
						Text(name)
							.font(.system(size: 17, weight: .bold))
						Text("\(priceString) \(currency.rawValue.uppercased())")
							.font(.system(size: 10, weight: .medium))
					}
					.foregroundStyle(.ypBlack)
				}
				Spacer()
				Button(action: onCartTap) {
					Image(isAddedToCart ? .cartCross : .cart)
						.foregroundStyle(.ypBlack)
				}
			}
		}
	}

}

// MARK: - Preview
#Preview {
	HStack {
		NFTCardView(
			name: "Test name",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/1.png"),
			rating: 3,
			price: 31.12,
			currency: .eth,
			isFavorite: true,
			isAddedToCart: true,
			onCartTap: { },
			onFavoriteTap: { }
		)
		NFTCardView(
			name: "Test name",
			imageURL: URL(string: "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/1.png"),
			rating: 0,
			price: 31,
			currency: .eth,
			isFavorite: false,
			isAddedToCart: false,
			onCartTap: { },
			onFavoriteTap: { }
		)
		NFTCardView(
			name: "Test name",
			imageURL: nil,
			rating: 0,
			price: 31.1,
			currency: .eth,
			isFavorite: false,
			isAddedToCart: false,
			onCartTap: { },
			onFavoriteTap: { }
		)
	}
}
