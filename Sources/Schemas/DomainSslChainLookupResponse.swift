import Foundation

public struct DomainSslChainLookupResponse: Codable, Hashable, Sendable {
    public let domainName: String
    public let queryTime: Date
    public let sslCertificates: [DomainSslChainLookupResponseSslCertificatesItem]
    public let sslRaw: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainName: String,
        queryTime: Date,
        sslCertificates: [DomainSslChainLookupResponseSslCertificatesItem],
        sslRaw: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainName = domainName
        self.queryTime = queryTime
        self.sslCertificates = sslCertificates
        self.sslRaw = sslRaw
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.queryTime = try container.decode(Date.self, forKey: .queryTime)
        self.sslCertificates = try container.decode([DomainSslChainLookupResponseSslCertificatesItem].self, forKey: .sslCertificates)
        self.sslRaw = try container.decodeIfPresent(String.self, forKey: .sslRaw)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.sslCertificates, forKey: .sslCertificates)
        try container.encodeIfPresent(self.sslRaw, forKey: .sslRaw)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainName
        case queryTime
        case sslCertificates
        case sslRaw
    }
}