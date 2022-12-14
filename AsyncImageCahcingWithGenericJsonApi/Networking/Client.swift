//
//  Client.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import Foundation

final class Client: AsyncGenericApi {

	let session: URLSession

	init(configuration: URLSessionConfiguration) {
		self.session = URLSession(configuration: configuration)
	}

	convenience init() {
		self.init(configuration: .default)
	}
}
