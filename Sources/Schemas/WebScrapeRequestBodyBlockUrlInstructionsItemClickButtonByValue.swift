import Foundation

/// A selector/value pair used by fill, select, and clickButtonByValue instructions.
public struct WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue: Codable, Hashable, Sendable {
    /// CSS or XPath selector identifying the target element.
    public let place: String
    /// Value to fill, select, or match against.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        place: String,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.place = place
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.place = try container.decode(String.self, forKey: .place)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.place, forKey: .place)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case place
        case value
    }
}