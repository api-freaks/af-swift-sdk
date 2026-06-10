import Foundation

public struct DomainWhoisHistoryResponse: Codable, Hashable, Sendable {
    /// Determines whether the request was successfully processed or not.
    public let status: Bool
    /// Indicates that this response contains historical data.
    public let whois: DomainWhoisHistoryResponseWhois
    /// Shows the total number of records found for the queried domain.
    public let totalRecords: String
    public let whoisDomainsHistorical: [DomainWhoisHistoryResponseWhoisDomainsHistoricalItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        whois: DomainWhoisHistoryResponseWhois,
        totalRecords: String,
        whoisDomainsHistorical: [DomainWhoisHistoryResponseWhoisDomainsHistoricalItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.whois = whois
        self.totalRecords = totalRecords
        self.whoisDomainsHistorical = whoisDomainsHistorical
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.whois = try container.decode(DomainWhoisHistoryResponseWhois.self, forKey: .whois)
        self.totalRecords = try container.decode(String.self, forKey: .totalRecords)
        self.whoisDomainsHistorical = try container.decode([DomainWhoisHistoryResponseWhoisDomainsHistoricalItem].self, forKey: .whoisDomainsHistorical)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.whois, forKey: .whois)
        try container.encode(self.totalRecords, forKey: .totalRecords)
        try container.encode(self.whoisDomainsHistorical, forKey: .whoisDomainsHistorical)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case whois
        case totalRecords = "total_records"
        case whoisDomainsHistorical = "whois_domains_historical"
    }
}