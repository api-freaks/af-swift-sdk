import Foundation

/// Domain-based Message Authentication, Reporting and Conformance configuration.
public struct DomainReputationResponseEmailDeliverabilityAuthenticationDmarc: Codable, Hashable, Sendable {
    /// Indicates whether a DMARC record was found.
    public let present: Bool
    /// DMARC enforcement policy applied to failing messages (e.g. none, quarantine, reject).
    public let policy: String
    /// Indicates whether DMARC aggregate / forensic reporting addresses are configured.
    public let reportingConfigured: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        present: Bool,
        policy: String,
        reportingConfigured: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.present = present
        self.policy = policy
        self.reportingConfigured = reportingConfigured
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.present = try container.decode(Bool.self, forKey: .present)
        self.policy = try container.decode(String.self, forKey: .policy)
        self.reportingConfigured = try container.decode(Bool.self, forKey: .reportingConfigured)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.present, forKey: .present)
        try container.encode(self.policy, forKey: .policy)
        try container.encode(self.reportingConfigured, forKey: .reportingConfigured)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case present
        case policy
        case reportingConfigured = "reporting_configured"
    }
}