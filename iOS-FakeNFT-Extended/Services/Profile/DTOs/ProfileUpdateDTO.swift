//
//  ProfileUpdateDTO.swift
//  iOS-FakeNFT-Extended
//
//  Created by Hajime4life on 14.10.2025.
//

import Foundation

struct ProfileUpdateDTO {
	let name: String?
	let avatar: String?
	let description: String?
	let website: String?
	let likes: [String]?
	
	func toFormURLEncoded() -> Data? {
		var components = URLComponents()
		var queryItems: [URLQueryItem] = []
		
		if let name = name {
			queryItems.append(URLQueryItem(name: "name", value: name))
		}
		if let avatar = avatar {
			queryItems.append(URLQueryItem(name: "avatar", value: avatar))
		}
		if let description = description {
			queryItems.append(URLQueryItem(name: "description", value: description))
		}
		if let website = website {
			queryItems.append(URLQueryItem(name: "website", value: website))
		}
		if let likes = likes, !likes.isEmpty {
			let likesString = likes.joined(separator: ",")
			queryItems.append(URLQueryItem(name: "likes", value: likesString))
		}
		
		components.queryItems = queryItems
		return components.query?.data(using: .utf8)
	}
}
