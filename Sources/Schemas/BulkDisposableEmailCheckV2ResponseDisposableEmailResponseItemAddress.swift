import Foundation

/// Geolocation and security enrichment data for the IP address.
public struct BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddress: Codable, Hashable, Sendable {
    /// IP recognized/reachable by the geolocation provider.
    public let validIpAddress: Bool?
    /// Geolocation data derived from the IP address.
    public let location: BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressLocation?
    /// Threat and anonymity profile for the IP address.
    public let security: BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressSecurity?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        validIpAddress: Bool? = nil,
        location: BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressLocation? = nil,
        security: BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressSecurity? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.validIpAddress = validIpAddress
        self.location = location
        self.security = security
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.validIpAddress = try container.decodeIfPresent(Bool.self, forKey: .validIpAddress)
        self.location = try container.decodeIfPresent(BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressLocation.self, forKey: .location)
        self.security = try container.decodeIfPresent(BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAddressSecurity.self, forKey: .security)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.validIpAddress, forKey: .validIpAddress)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.security, forKey: .security)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case validIpAddress
        case location
        case security
    }
}