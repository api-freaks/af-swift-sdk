import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNotice: Codable, Hashable, Sendable {
    public let explicitText: String?
    public let noticeRef: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNoticeNoticeRef?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        explicitText: String? = nil,
        noticeRef: DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNoticeNoticeRef? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.explicitText = explicitText
        self.noticeRef = noticeRef
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.explicitText = try container.decodeIfPresent(String.self, forKey: .explicitText)
        self.noticeRef = try container.decodeIfPresent(DomainSslChainLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNoticeNoticeRef.self, forKey: .noticeRef)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.explicitText, forKey: .explicitText)
        try container.encodeIfPresent(self.noticeRef, forKey: .noticeRef)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case explicitText
        case noticeRef
    }
}