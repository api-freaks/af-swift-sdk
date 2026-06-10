import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemExtensions: Codable, Hashable, Sendable {
    public let authorityKeyIdentifier: String
    public let subjectKeyIdentifier: String
    public let keyUsages: [String]
    public let extendedKeyUsages: [String]
    public let crlDistributionPoints: [String]?
    public let authorityInfoAccess: DomainSslChainLookupResponseSslCertificatesItemExtensionsAuthorityInfoAccess
    public let subjectAlternativeNames: DomainSslChainLookupResponseSslCertificatesItemExtensionsSubjectAlternativeNames?
    public let certificatePolicies: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePolicies
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorityKeyIdentifier: String,
        subjectKeyIdentifier: String,
        keyUsages: [String],
        extendedKeyUsages: [String],
        crlDistributionPoints: [String]? = nil,
        authorityInfoAccess: DomainSslChainLookupResponseSslCertificatesItemExtensionsAuthorityInfoAccess,
        subjectAlternativeNames: DomainSslChainLookupResponseSslCertificatesItemExtensionsSubjectAlternativeNames? = nil,
        certificatePolicies: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePolicies,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorityKeyIdentifier = authorityKeyIdentifier
        self.subjectKeyIdentifier = subjectKeyIdentifier
        self.keyUsages = keyUsages
        self.extendedKeyUsages = extendedKeyUsages
        self.crlDistributionPoints = crlDistributionPoints
        self.authorityInfoAccess = authorityInfoAccess
        self.subjectAlternativeNames = subjectAlternativeNames
        self.certificatePolicies = certificatePolicies
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorityKeyIdentifier = try container.decode(String.self, forKey: .authorityKeyIdentifier)
        self.subjectKeyIdentifier = try container.decode(String.self, forKey: .subjectKeyIdentifier)
        self.keyUsages = try container.decode([String].self, forKey: .keyUsages)
        self.extendedKeyUsages = try container.decode([String].self, forKey: .extendedKeyUsages)
        self.crlDistributionPoints = try container.decodeIfPresent([String].self, forKey: .crlDistributionPoints)
        self.authorityInfoAccess = try container.decode(DomainSslChainLookupResponseSslCertificatesItemExtensionsAuthorityInfoAccess.self, forKey: .authorityInfoAccess)
        self.subjectAlternativeNames = try container.decodeIfPresent(DomainSslChainLookupResponseSslCertificatesItemExtensionsSubjectAlternativeNames.self, forKey: .subjectAlternativeNames)
        self.certificatePolicies = try container.decode(DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePolicies.self, forKey: .certificatePolicies)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authorityKeyIdentifier, forKey: .authorityKeyIdentifier)
        try container.encode(self.subjectKeyIdentifier, forKey: .subjectKeyIdentifier)
        try container.encode(self.keyUsages, forKey: .keyUsages)
        try container.encode(self.extendedKeyUsages, forKey: .extendedKeyUsages)
        try container.encodeIfPresent(self.crlDistributionPoints, forKey: .crlDistributionPoints)
        try container.encode(self.authorityInfoAccess, forKey: .authorityInfoAccess)
        try container.encodeIfPresent(self.subjectAlternativeNames, forKey: .subjectAlternativeNames)
        try container.encode(self.certificatePolicies, forKey: .certificatePolicies)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorityKeyIdentifier
        case subjectKeyIdentifier
        case keyUsages
        case extendedKeyUsages
        case crlDistributionPoints
        case authorityInfoAccess
        case subjectAlternativeNames
        case certificatePolicies
    }
}