//
//  GoogleSearchResponse.swift
//  GoogleCustomSearch
//
//  Created by Bean John on 10/16/24.
//

import Foundation

public struct GoogleSearchResponse: Codable {
	
	/// Property for information about the search
	public var searchInformation: SearchInfo
	/// Property for search results
	public var items: [SearchResult]
	
	/// Computed property returning the number of search results
	public var resultCount: Int {
		return self.items.count
	}
	
	/// Computed property returning all search result URLs
	public var resultUrls: [URL] {
		return self.items.map(\.url)
	}
	
	public struct SearchResult: Codable {
		/// Property for the title of the website's contents
		public var title: String
		/// Property for a link to the website
		public var link: String
		/// Computed property returning a URL to the website
		public var url: URL {
			return URL(string: link)!
		}
	}
	
	public struct SearchInfo: Codable {
		/// Property containing time spent on search
		public var searchTime: Double
		/// Property containing total result count on Google
		public var totalResults: String
	}
	
}
