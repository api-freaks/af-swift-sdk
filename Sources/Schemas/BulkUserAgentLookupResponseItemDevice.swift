import Foundation

public struct BulkUserAgentLookupResponseItemDevice: Codable, Hashable, Sendable {
    /// Device name or the hardware that was used
    public let name: String
    /// Device type or the hardware type. Possible values:
    /// 1. Desktop
    /// 2. Mobile
    /// 3. Tablet
    /// 4. Phone
    /// 5. Watch
    /// 6. Virtual Reality
    /// 7. eReader
    /// 8. Set-top box
    /// 9. TV
    /// 10. Game Console
    /// 11. Handheld Game Console
    /// 12. Voice
    /// 13. Robot
    /// 14. Robot Mobile
    /// 15. Robot Imitator
    /// 16. Hacker
    /// 17. Anonymized
    /// 18. Unknown
    public let type: String
    /// Device brand or the hardware brand name
    public let brand: String
    /// Device's CPU model or machine CPU
    public let cpu: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: String,
        brand: String,
        cpu: String,
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
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.cpu = try container.decode(String.self, forKey: .cpu)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.cpu, forKey: .cpu)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case brand
        case cpu
    }
}