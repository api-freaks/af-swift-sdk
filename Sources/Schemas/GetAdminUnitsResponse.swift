import Foundation

public struct GetAdminUnitsResponse: Codable, Hashable, Sendable {
    public let adminUnits: [GetAdminUnitsResponseAdminUnitsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adminUnits: [GetAdminUnitsResponseAdminUnitsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adminUnits = adminUnits
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adminUnits = try container.decode([GetAdminUnitsResponseAdminUnitsItem].self, forKey: .adminUnits)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adminUnits, forKey: .adminUnits)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adminUnits = "admin_units"
    }
}