import Foundation

public struct BulkGeolocationLookupResponseItemUserAgentDevice: Codable, Hashable, Sendable {
    public let name: String?
    public let type: String?
    public let brand: String?
    public let cpu: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        type: String? = nil,
        brand: String? = nil,
        cpu: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.brand = brand
        self.cpu = cpu
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.brand = try container.decodeIfPresent(String.self, forKey: .brand)
        self.cpu = try container.decodeIfPresent(String.self, forKey: .cpu)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.cpu, forKey: .cpu)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case brand
        case cpu
    }
}