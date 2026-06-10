import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemNewTab: Codable, Hashable, Sendable {
    public let newTab: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        newTab: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.newTab = newTab
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newTab = try container.decodeIfPresent(Bool.self, forKey: .newTab)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.newTab, forKey: .newTab)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case newTab
    }
}