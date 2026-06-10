import Foundation

public struct DomainDnsReverseResponse: Codable, Hashable, Sendable {
    public let totalRecords: Int
    public let totalPages: Int
    public let currentPage: Int
    public let reverseDnsRecords: [DomainDnsReverseResponseReverseDnsRecordsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalRecords: Int,
        totalPages: Int,
        currentPage: Int,
        reverseDnsRecords: [DomainDnsReverseResponseReverseDnsRecordsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalRecords = totalRecords
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.reverseDnsRecords = reverseDnsRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalRecords = try container.decode(Int.self, forKey: .totalRecords)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.reverseDnsRecords = try container.decode([DomainDnsReverseResponseReverseDnsRecordsItem].self, forKey: .reverseDnsRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.totalRecords, forKey: .totalRecords)
        try container.encode(self.totalPages, forKey: .totalPages)
        try container.encode(self.currentPage, forKey: .currentPage)
        try container.encode(self.reverseDnsRecords, forKey: .reverseDnsRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalRecords
        case totalPages
        case currentPage
        case reverseDnsRecords
    }
}