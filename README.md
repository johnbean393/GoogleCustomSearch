<h1 align="center">GoogleCustomSearch</h1>

A Swift Package to search Google with the Programmable Search Engine API.

## Usage

- Search

```
let query: String = "I have a stupid question"
let searchEngineId: String = "mySuperSecretSearchEngineId"
let apiKey: String = "mySuperSecretAPIKey"
do {
	let response: GoogleSearchResponse = try await GoogleCustomSearch.search(
		query: query,
		searchEngineId: searchEngineId,
		apiKey: apiKey,
		resultNum: 5
	)
	print("results: \(response.items)")
} catch {
	print("Error: \(error)")
}
```

## Installation

**Requirements**
- Xcode ≥ 15

**Swift Package Manager**
```
dependencies: [
	.package(url: "https://github.com/johnbean393/GoogleCustomSearch", branch: "main")
]
```

## Contributing

Contributions are very welcome. Let's make ExtractKit-macOS simple and powerful.
