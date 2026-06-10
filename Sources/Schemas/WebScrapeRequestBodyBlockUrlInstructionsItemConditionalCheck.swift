import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck: Codable, Hashable, Sendable {
    public let conditionalCheck: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conditionalCheck: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conditionalCheck = conditionalCheck
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conditionalCheck = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .conditionalCheck)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conditionalCheck, forKey: .conditionalCheck)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conditionalCheck
    }
}