import Foundation

public struct GetAdminUnitsResponseAdminUnitsItem: Codable, Hashable, Sendable {
    public let name: String
    public let adminCode: String
    public let adminLevel: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        adminCode: String,
        adminLevel: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.adminCode = adminCode
        self.adminLevel = adminLevel
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.adminCode = try container.decode(String.self, forKey: .adminCode)
        self.adminLevel = try container.decode(String.self, forKey: .adminLevel)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.adminCode, forKey: .adminCode)
        try container.encode(self.adminLevel, forKey: .adminLevel)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case adminCode = "admin_code"
        case adminLevel = "admin_level"
    }
}