import Foundation

/// A related indicator of compromise.
public struct DomainReputationResponseIntelligenceRelatedIocsItem: Codable, Hashable, Sendable {
    /// Type of the related IOC (e.g. ipv4, ipv6).
    public let type: String
    /// Value of the related IOC.
    public let value: String
    /// Confidence score for the related IOC (0-1).
    public let confidence: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String,
        value: String,
        confidence: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.value = value
        self.confidence = confidence
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.value = try container.decode(String.self, forKey: .value)
        self.confidence = try container.decode(Float.self, forKey: .confidence)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.confidence, forKey: .confidence)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case value
        case confidence
    }
}