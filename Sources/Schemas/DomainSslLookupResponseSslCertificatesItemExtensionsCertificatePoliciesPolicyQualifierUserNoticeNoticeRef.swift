import Foundation

public struct DomainSslLookupResponseSslCertificatesItemExtensionsCertificatePoliciesPolicyQualifierUserNoticeNoticeRef: Codable, Hashable, Sendable {
    public let organization: String?
    public let noticeNumbers: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        organization: String? = nil,
        noticeNumbers: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.organization = organization
        self.noticeNumbers = noticeNumbers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.noticeNumbers = try container.decodeIfPresent(String.self, forKey: .noticeNumbers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.noticeNumbers, forKey: .noticeNumbers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case organization
        case noticeNumbers
    }
}