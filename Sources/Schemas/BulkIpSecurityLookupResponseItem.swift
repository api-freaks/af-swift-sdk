import Foundation

public struct BulkIpSecurityLookupResponseItem: Codable, Hashable, Sendable {
    public let ip: String?
    public let security: BulkIpSecurityLookupResponseItemSecurity?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        security: BulkIpSecurityLookupResponseItemSecurity? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.security = security
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.security = try container.decodeIfPresent(BulkIpSecurityLookupResponseItemSecurity.self, forKey: .security)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.security, forKey: .security)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case security
    }
}