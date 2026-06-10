import Foundation

public struct DomainSslLookupResponseSslCertificatesItem: Codable, Hashable, Sendable {
    public let chainOrder: String
    public let authenticationType: String
    public let validityStartDate: String
    public let validityEndDate: String
    public let serialNumber: String
    public let signatureAlgorithm: String
    public let subject: DomainSslLookupResponseSslCertificatesItemSubject
    public let issuer: DomainSslLookupResponseSslCertificatesItemIssuer
    public let publicKey: DomainSslLookupResponseSslCertificatesItemPublicKey
    public let extensions: DomainSslLookupResponseSslCertificatesItemExtensions
    /// Raw certificate in PEM format
    public let pemRaw: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        chainOrder: String,
        authenticationType: String,
        validityStartDate: String,
        validityEndDate: String,
        serialNumber: String,
        signatureAlgorithm: String,
        subject: DomainSslLookupResponseSslCertificatesItemSubject,
        issuer: DomainSslLookupResponseSslCertificatesItemIssuer,
        publicKey: DomainSslLookupResponseSslCertificatesItemPublicKey,
        extensions: DomainSslLookupResponseSslCertificatesItemExtensions,
        pemRaw: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.chainOrder = chainOrder
        self.authenticationType = authenticationType
        self.validityStartDate = validityStartDate
        self.validityEndDate = validityEndDate
        self.serialNumber = serialNumber
        self.signatureAlgorithm = signatureAlgorithm
        self.subject = subject
        self.issuer = issuer
        self.publicKey = publicKey
        self.extensions = extensions
        self.pemRaw = pemRaw
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chainOrder = try container.decode(String.self, forKey: .chainOrder)
        self.authenticationType = try container.decode(String.self, forKey: .authenticationType)
        self.validityStartDate = try container.decode(String.self, forKey: .validityStartDate)
        self.validityEndDate = try container.decode(String.self, forKey: .validityEndDate)
        self.serialNumber = try container.decode(String.self, forKey: .serialNumber)
        self.signatureAlgorithm = try container.decode(String.self, forKey: .signatureAlgorithm)
        self.subject = try container.decode(DomainSslLookupResponseSslCertificatesItemSubject.self, forKey: .subject)
        self.issuer = try container.decode(DomainSslLookupResponseSslCertificatesItemIssuer.self, forKey: .issuer)
        self.publicKey = try container.decode(DomainSslLookupResponseSslCertificatesItemPublicKey.self, forKey: .publicKey)
        self.extensions = try container.decode(DomainSslLookupResponseSslCertificatesItemExtensions.self, forKey: .extensions)
        self.pemRaw = try container.decodeIfPresent(String.self, forKey: .pemRaw)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.chainOrder, forKey: .chainOrder)
        try container.encode(self.authenticationType, forKey: .authenticationType)
        try container.encode(self.validityStartDate, forKey: .validityStartDate)
        try container.encode(self.validityEndDate, forKey: .validityEndDate)
        try container.encode(self.serialNumber, forKey: .serialNumber)
        try container.encode(self.signatureAlgorithm, forKey: .signatureAlgorithm)
        try container.encode(self.subject, forKey: .subject)
        try container.encode(self.issuer, forKey: .issuer)
        try container.encode(self.publicKey, forKey: .publicKey)
        try container.encode(self.extensions, forKey: .extensions)
        try container.encodeIfPresent(self.pemRaw, forKey: .pemRaw)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case chainOrder
        case authenticationType
        case validityStartDate
        case validityEndDate
        case serialNumber
        case signatureAlgorithm
        case subject
        case issuer
        case publicKey
        case extensions
        case pemRaw
    }
}