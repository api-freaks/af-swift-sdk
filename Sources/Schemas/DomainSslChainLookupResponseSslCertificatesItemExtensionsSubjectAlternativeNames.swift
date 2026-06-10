import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemExtensionsSubjectAlternativeNames: Codable, Hashable, Sendable {
    public let dnsNames: [String]?
    public let emailAddresses: [String]?
    public let ipAddresses: [String]?
    public let uris: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dnsNames: [String]? = nil,
        emailAddresses: [String]? = nil,
        ipAddresses: [String]? = nil,
        uris: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dnsNames = dnsNames
        self.emailAddresses = emailAddresses
        self.ipAddresses = ipAddresses
        self.uris = uris
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dnsNames = try container.decodeIfPresent([String].self, forKey: .dnsNames)
        self.emailAddresses = try container.decodeIfPresent([String].self, forKey: .emailAddresses)
        self.ipAddresses = try container.decodeIfPresent([String].self, forKey: .ipAddresses)
        self.uris = try container.decodeIfPresent([String].self, forKey: .uris)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.dnsNames, forKey: .dnsNames)
        try container.encodeIfPresent(self.emailAddresses, forKey: .emailAddresses)
        try container.encodeIfPresent(self.ipAddresses, forKey: .ipAddresses)
        try container.encodeIfPresent(self.uris, forKey: .uris)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dnsNames
        case emailAddresses
        case ipAddresses
        case uris
    }
}