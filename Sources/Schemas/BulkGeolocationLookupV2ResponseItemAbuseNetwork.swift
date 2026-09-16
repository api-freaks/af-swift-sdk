import Foundation

/// Network information for the IP.
public struct BulkGeolocationLookupV2ResponseItemAbuseNetwork: Codable, Hashable, Sendable {
    /// Network access type classification (e.g., DSL, Cable, Mobile, 5G) when available.
    public let connectionType: String?
    /// Network prefix in CIDR notation that contains the IP.
    public let route: String?
    /// true if the IP is anycast (same IP announced from multiple locations).
    public let isAnycast: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        connectionType: String? = nil,
        route: String? = nil,
        isAnycast: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.connectionType = connectionType
        self.route = route
        self.isAnycast = isAnycast
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.connectionType = try container.decodeIfPresent(String.self, forKey: .connectionType)
        self.route = try container.decodeIfPresent(String.self, forKey: .route)
        self.isAnycast = try container.decodeIfPresent(Bool.self, forKey: .isAnycast)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.connectionType, forKey: .connectionType)
        try container.encodeIfPresent(self.route, forKey: .route)
        try container.encodeIfPresent(self.isAnycast, forKey: .isAnycast)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case connectionType = "connection_type"
        case route
        case isAnycast = "is_anycast"
    }
}