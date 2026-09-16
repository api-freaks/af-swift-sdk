import Foundation

/// Mail server infrastructure backing the domain.
public struct DomainReputationResponseEmailDeliverabilityInfrastructure: Codable, Hashable, Sendable {
    /// Number of MX records found for the domain.
    public let mxCount: Int
    /// List of mail exchange server hostnames for the domain.
    public let mxRecords: [String]
    /// Email hosting provider inferred from the MX records.
    public let mxProvider: String
    /// Indicates whether the domain explicitly declines email via a null MX record.
    public let nullMx: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mxCount: Int,
        mxRecords: [String],
        mxProvider: String,
        nullMx: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mxCount = mxCount
        self.mxRecords = mxRecords
        self.mxProvider = mxProvider
        self.nullMx = nullMx
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mxCount = try container.decode(Int.self, forKey: .mxCount)
        self.mxRecords = try container.decode([String].self, forKey: .mxRecords)
        self.mxProvider = try container.decode(String.self, forKey: .mxProvider)
        self.nullMx = try container.decode(Bool.self, forKey: .nullMx)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.mxCount, forKey: .mxCount)
        try container.encode(self.mxRecords, forKey: .mxRecords)
        try container.encode(self.mxProvider, forKey: .mxProvider)
        try container.encode(self.nullMx, forKey: .nullMx)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mxCount = "mx_count"
        case mxRecords = "mx_records"
        case mxProvider = "mx_provider"
        case nullMx = "null_mx"
    }
}