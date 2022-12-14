//
//  AsyncGenericApi.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import Foundation

protocol AsyncGenericApi {
	
    var session: URLSession { get }
	
    func fetch<T: Decodable>(type: T.Type, with request: URLRequest) async throws -> T
}

extension AsyncGenericApi {
	func fetch<T: Decodable>(type: T.Type, with request: URLRequest) async throws -> T {
		
        let (data, response) = try await session.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse else {
			throw ApiError.requestFailed(description: "Invalid response")
		}
		guard httpResponse.statusCode == 200 else {
			throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
		}

		do {
			let decoder = JSONDecoder()
			return try decoder.decode(type, from: data)
		} catch {
			throw ApiError.jsonConversionFailure(description: error.localizedDescription)
		}
	}
}
