import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemEnter: Codable, Hashable, Sendable {
    public let enter: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enter: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enter = enter
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enter = try container.decodeIfPresent(String.self, forKey: .enter)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enter, forKey: .enter)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enter
    }
}