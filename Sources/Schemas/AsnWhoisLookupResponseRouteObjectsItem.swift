import Foundation

public struct AsnWhoisLookupResponseRouteObjectsItem: Codable, Hashable, Sendable {
    public let route: String
    public let origin: String
    public let originName: String
    public let isp: String
    public let numberOfIps: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        route: String,
        origin: String,
        originName: String,
        isp: String,
        numberOfIps: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.route = route
        self.origin = origin
        self.originName = originName
        self.isp = isp
        self.numberOfIps = numberOfIps
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.route = try container.decode(String.self, forKey: .route)
        self.origin = try container.decode(String.self, forKey: .origin)
        self.originName = try container.decode(String.self, forKey: .originName)
        self.isp = try container.decode(String.self, forKey: .isp)
        self.numberOfIps = try container.decode(Int.self, forKey: .numberOfIps)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.originName, forKey: .originName)
        try container.encode(self.isp, forKey: .isp)
        try container.encode(self.numberOfIps, forKey: .numberOfIps)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case route
        case origin
        case originName
        case isp
        case numberOfIps
    }
}