import Foundation

public struct GetAdminLevelsResponse: Codable, Hashable, Sendable {
    public let adminLevels: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adminLevels: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adminLevels = adminLevels
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adminLevels = try container.decode([String].self, forKey: .adminLevels)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adminLevels, forKey: .adminLevels)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adminLevels = "admin_levels"
    }
}