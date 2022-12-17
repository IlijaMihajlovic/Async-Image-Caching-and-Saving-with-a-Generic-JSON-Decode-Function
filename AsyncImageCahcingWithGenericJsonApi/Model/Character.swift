//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import Foundation

struct Characters: Codable  {
	let results: [Character]
}

struct Character: Codable, Hashable, Identifiable {
	let id: Int
	let name: String
	let status: String
	let species: String
	let gender: String
	let image: String
	
	enum CodingKeys: CodingKey {
		case id
		case name
		case status
		case species
		case gender
		case image
	}
}


