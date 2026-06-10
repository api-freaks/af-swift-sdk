import Foundation

public struct SubdomainsLookupResponse: Codable, Hashable, Sendable {
    public let domain: String
    public let status: Bool
    public let queryTime: String
    public let currentPage: Int
    public let totalPages: Int
    public let totalRecords: Int
    public let subdomains: [SubdomainsLookupResponseSubdomainsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String,
        status: Bool,
        queryTime: String,
        currentPage: Int,
        totalPages: Int,
        totalRecords: Int,
        subdomains: [SubdomainsLookupResponseSubdomainsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.status = status
        self.queryTime = queryTime
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.totalRecords = totalRecords
        self.subdomains = subdomains
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.queryTime = try container.decode(String.self, forKey: .queryTime)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.totalRecords = try container.decode(Int.self, forKey: .totalRecords)
        self.subdomains = try container.decode([SubdomainsLookupResponseSubdomainsItem].self, forKey: .subdomains)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.currentPage, forKey: .currentPage)
        try container.encode(self.totalPages, forKey: .totalPages)
        try container.encode(self.totalRecords, forKey: .totalRecords)
        try container.encode(self.subdomains, forKey: .subdomains)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case status
        case queryTime = "query_time"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case totalRecords = "total_records"
        case subdomains
    }
}