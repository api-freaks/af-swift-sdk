import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifier: Codable, Hashable, Sendable {
    public let oid: String?
    public let cpsUri: String?
    public let userNotice: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNotice?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        oid: String? = nil,
        cpsUri: String? = nil,
        userNotice: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNotice? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.oid = oid
        self.cpsUri = cpsUri
        self.userNotice = userNotice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.oid = try container.decodeIfPresent(String.self, forKey: .oid)
        self.cpsUri = try container.decodeIfPresent(String.self, forKey: .cpsUri)
        self.userNotice = try container.decodeIfPresent(DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNotice.self, forKey: .userNotice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.oid, forKey: .oid)
        try container.encodeIfPresent(self.cpsUri, forKey: .cpsUri)
        try container.encodeIfPresent(self.userNotice, forKey: .userNotice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case oid
        case cpsUri
        case userNotice
    }
}