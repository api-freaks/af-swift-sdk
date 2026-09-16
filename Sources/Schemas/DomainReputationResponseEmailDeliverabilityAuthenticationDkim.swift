import Foundation

/// DomainKeys Identified Mail configuration.
public struct DomainReputationResponseEmailDeliverabilityAuthenticationDkim: Codable, Hashable, Sendable {
    /// Indicates whether a DKIM record was found for any probed selector.
    public let found: Bool
    /// List of DKIM selectors for which a record was found.
    public let selectorsFound: [String]
    /// Email service providers inferred from the matched DKIM selectors.
    public let providersDetected: [String]
    /// Clarifying note about the limitations of DKIM selector probing.
    public let note: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        found: Bool,
        selectorsFound: [String],
        providersDetected: [String],
        note: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.found = found
        self.selectorsFound = selectorsFound
        self.providersDetected = providersDetected
        self.note = note
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.found = try container.decode(Bool.self, forKey: .found)
        self.selectorsFound = try container.decode([String].self, forKey: .selectorsFound)
        self.providersDetected = try container.decode([String].self, forKey: .providersDetected)
        self.note = try container.decode(String.self, forKey: .note)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.found, forKey: .found)
        try container.encode(self.selectorsFound, forKey: .selectorsFound)
        try container.encode(self.providersDetected, forKey: .providersDetected)
        try container.encode(self.note, forKey: .note)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case found
        case selectorsFound = "selectors_found"
        case providersDetected = "providers_detected"
        case note
    }
}