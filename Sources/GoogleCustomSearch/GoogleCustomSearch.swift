// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class GoogleCustomSearch {
	
	public static func search(
		query: String,
		searchEngineId: String,
		apiKey: String,
		resultNum: Int = 10
	) async throws -> GoogleSearchResponse {
		let root: URL = URL(string: "https://customsearch.googleapis.com/")!
		let baseUrl: URL = URL(
			string: "customsearch/v1",
			relativeTo: root
		)!
		var components = URLComponents()
		components.queryItems = [
			URLQueryItem(name: "cx", value: searchEngineId),
			URLQueryItem(name: "num", value: "\(resultNum)"),
			URLQueryItem(name: "q", value: query),
			URLQueryItem(name: "key", value: apiKey),
		]
		let url: URL = components.url(relativeTo: baseUrl)!
		let (data, _): (Data, URLResponse) = try await URLSession.shared.data(
			from: url
		)
		let decoder: JSONDecoder = JSONDecoder()
		let response: GoogleSearchResponse = try decoder.decode(
			GoogleSearchResponse.self,
			from: data
		)
		return response
	}

}
