import Foundation

public struct DomainSslLookupResponseSslCertificatesItemExtensionsAuthorityInfoAccess: Codable, Hashable, Sendable {
    public let issuers: [String]?
    public let ocsp: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        issuers: [String]? = nil,
        ocsp: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.issuers = issuers
        self.ocsp = ocsp
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.issuers = try container.decodeIfPresent([String].self, forKey: .issuers)
        self.ocsp = try container.decodeIfPresent([String].self, forKey: .ocsp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.issuers, forKey: .issuers)
        try container.encodeIfPresent(self.ocsp, forKey: .ocsp)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case issuers
        case ocsp
    }
}