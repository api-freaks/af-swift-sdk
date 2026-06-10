import Foundation

public struct ZipcodeSearchByRegionResponse: Codable, Hashable, Sendable {
    /// Total number of ZIP/postal codes found
    public let totalResults: Int?
    /// Total number of pages available
    public let totalPages: Int?
    /// Current page number
    public let currentPage: Int?
    /// Number of ZIP/postal codes in the current page
    public let currentPageSize: Int?
    /// List of ZIP/postal codes
    public let codes: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalResults: Int? = nil,
        totalPages: Int? = nil,
        currentPage: Int? = nil,
        currentPageSize: Int? = nil,
        codes: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.currentPageSize = currentPageSize
        self.codes = codes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.currentPageSize = try container.decodeIfPresent(Int.self, forKey: .currentPageSize)
        self.codes = try container.decodeIfPresent([String].self, forKey: .codes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalResults, forKey: .totalResults)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.currentPageSize, forKey: .currentPageSize)
        try container.encodeIfPresent(self.codes, forKey: .codes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case currentPageSize = "current_page_size"
        case codes
    }
}