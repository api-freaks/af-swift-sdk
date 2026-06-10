import Foundation

public struct ZipcodeSearchByRadiusResponse: Codable, Hashable, Sendable {
    /// Total number of ZIP/postal codes found within the radius
    public let totalResults: Int?
    /// Total number of pages available
    public let totalPages: Int?
    /// Current page number
    public let currentPage: Int?
    /// Number of ZIP/postal codes in the current page
    public let currentPageSize: Int?
    public let results: [ZipcodeSearchByRadiusResponseResultsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalResults: Int? = nil,
        totalPages: Int? = nil,
        currentPage: Int? = nil,
        currentPageSize: Int? = nil,
        results: [ZipcodeSearchByRadiusResponseResultsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.currentPageSize = currentPageSize
        self.results = results
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.currentPageSize = try container.decodeIfPresent(Int.self, forKey: .currentPageSize)
        self.results = try container.decodeIfPresent([ZipcodeSearchByRadiusResponseResultsItem].self, forKey: .results)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalResults, forKey: .totalResults)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.currentPageSize, forKey: .currentPageSize)
        try container.encodeIfPresent(self.results, forKey: .results)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case currentPageSize = "current_page_size"
        case results
    }
}