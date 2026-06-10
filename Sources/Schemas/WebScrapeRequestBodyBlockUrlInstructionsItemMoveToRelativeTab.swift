import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab: Codable, Hashable, Sendable {
    public let moveToRelativeTab: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        moveToRelativeTab: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.moveToRelativeTab = moveToRelativeTab
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.moveToRelativeTab = try container.decodeIfPresent(Int.self, forKey: .moveToRelativeTab)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.moveToRelativeTab, forKey: .moveToRelativeTab)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case moveToRelativeTab
    }
}