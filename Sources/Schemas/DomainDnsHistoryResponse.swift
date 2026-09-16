import Foundation

public struct DomainDnsHistoryResponse: Codable, Hashable, Sendable {
    public let totalRecords: Int?
    public let totalPages: Int?
    public let currentPage: Int?
    public let historicalDnsRecords: [DomainDnsHistoryResponseHistoricalDnsRecordsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalRecords: Int? = nil,
        totalPages: Int? = nil,
        currentPage: Int? = nil,
        historicalDnsRecords: [DomainDnsHistoryResponseHistoricalDnsRecordsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalRecords = totalRecords
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.historicalDnsRecords = historicalDnsRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalRecords = try container.decodeIfPresent(Int.self, forKey: .totalRecords)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.historicalDnsRecords = try container.decodeIfPresent([DomainDnsHistoryResponseHistoricalDnsRecordsItem].self, forKey: .historicalDnsRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalRecords, forKey: .totalRecords)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.historicalDnsRecords, forKey: .historicalDnsRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalRecords
        case totalPages
        case currentPage
        case historicalDnsRecords
    }
}