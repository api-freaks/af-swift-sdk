import Foundation

public struct DomainTyposquattingResponse: Codable, Hashable, Sendable {
    public let status: Bool
    public let totalRecords: Int
    public let currentPage: Int
    public let hasNextPage: Bool
    public let totalPages: Int
    /// Opaque token to pass as pageToken on the next request. Present only when hasNextPage is true.
    public let nextPageToken: String?
    public let domains: [DomainTyposquattingResponseDomainsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        totalRecords: Int,
        currentPage: Int,
        hasNextPage: Bool,
        totalPages: Int,
        nextPageToken: String? = nil,
        domains: [DomainTyposquattingResponseDomainsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.totalRecords = totalRecords
        self.currentPage = currentPage
        self.hasNextPage = hasNextPage
        self.totalPages = totalPages
        self.nextPageToken = nextPageToken
        self.domains = domains
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.totalRecords = try container.decode(Int.self, forKey: .totalRecords)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.nextPageToken = try container.decodeIfPresent(String.self, forKey: .nextPageToken)
        self.domains = try container.decode([DomainTyposquattingResponseDomainsItem].self, forKey: .domains)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.totalRecords, forKey: .totalRecords)
        try container.encode(self.currentPage, forKey: .currentPage)
        try container.encode(self.hasNextPage, forKey: .hasNextPage)
        try container.encode(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.nextPageToken, forKey: .nextPageToken)
        try container.encode(self.domains, forKey: .domains)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case totalRecords
        case currentPage
        case hasNextPage
        case totalPages
        case nextPageToken
        case domains
    }
}