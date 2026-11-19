import Foundation

public struct DomainWhoisReverseResponse: Codable, Hashable, Sendable {
    /// Total results found across the query.
    public let totalResult: Int?
    /// Total number of pages (50 records per page in default mode, 100 in mini mode).
    public let totalPages: Int?
    /// Current page number.
    public let currentPage: Int?
    public let whoisDomainsHistorical: [DomainWhoisReverseResponseWhoisDomainsHistoricalItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalResult: Int? = nil,
        totalPages: Int? = nil,
        currentPage: Int? = nil,
        whoisDomainsHistorical: [DomainWhoisReverseResponseWhoisDomainsHistoricalItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalResult = totalResult
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.whoisDomainsHistorical = whoisDomainsHistorical
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResult = try container.decodeIfPresent(Int.self, forKey: .totalResult)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.whoisDomainsHistorical = try container.decodeIfPresent([DomainWhoisReverseResponseWhoisDomainsHistoricalItem].self, forKey: .whoisDomainsHistorical)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalResult, forKey: .totalResult)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.whoisDomainsHistorical, forKey: .whoisDomainsHistorical)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalResult = "total_Result"
        case totalPages = "total_Pages"
        case currentPage = "current_Page"
        case whoisDomainsHistorical = "whois_domains_historical"
    }
}