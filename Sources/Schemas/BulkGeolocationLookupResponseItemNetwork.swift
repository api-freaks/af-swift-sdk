import Foundation

public struct BulkGeolocationLookupResponseItemNetwork: Codable, Hashable, Sendable {
    public let asn: BulkGeolocationLookupResponseItemNetworkAsn?
    /// The type of the connection
    public let connectionType: String?
    public let company: BulkGeolocationLookupResponseItemNetworkCompany?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asn: BulkGeolocationLookupResponseItemNetworkAsn? = nil,
        connectionType: String? = nil,
        company: BulkGeolocationLookupResponseItemNetworkCompany? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asn = asn
        self.connectionType = connectionType
        self.company = company
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asn = try container.decodeIfPresent(BulkGeolocationLookupResponseItemNetworkAsn.self, forKey: .asn)
        self.connectionType = try container.decodeIfPresent(String.self, forKey: .connectionType)
        self.company = try container.decodeIfPresent(BulkGeolocationLookupResponseItemNetworkCompany.self, forKey: .company)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.asn, forKey: .asn)
        try container.encodeIfPresent(self.connectionType, forKey: .connectionType)
        try container.encodeIfPresent(self.company, forKey: .company)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asn
        case connectionType = "connection_type"
        case company
    }
}