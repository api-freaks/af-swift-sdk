import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePolicies: Codable, Hashable, Sendable {
    public let policyId: String
    public let policyQualifier: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifier?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        policyId: String,
        policyQualifier: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifier? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.policyId = policyId
        self.policyQualifier = policyQualifier
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.policyId = try container.decode(String.self, forKey: .policyId)
        self.policyQualifier = try container.decodeIfPresent(DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifier.self, forKey: .policyQualifier)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.policyId, forKey: .policyId)
        try container.encodeIfPresent(self.policyQualifier, forKey: .policyQualifier)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case policyId
        case policyQualifier
    }
}