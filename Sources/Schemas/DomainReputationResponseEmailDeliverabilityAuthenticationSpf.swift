import Foundation

/// Sender Policy Framework configuration.
public struct DomainReputationResponseEmailDeliverabilityAuthenticationSpf: Codable, Hashable, Sendable {
    /// Indicates whether an SPF record was found.
    public let present: Bool
    /// SPF enforcement policy qualifier found in the record (e.g. ~all, -all).
    public let policy: String
    /// Raw SPF DNS TXT record string.
    public let record: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        present: Bool,
        policy: String,
        record: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.present = present
        self.policy = policy
        self.record = record
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.present = try container.decode(Bool.self, forKey: .present)
        self.policy = try container.decode(String.self, forKey: .policy)
        self.record = try container.decode(String.self, forKey: .record)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.present, forKey: .present)
        try container.encode(self.policy, forKey: .policy)
        try container.encode(self.record, forKey: .record)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case present
        case policy
        case record
    }
}