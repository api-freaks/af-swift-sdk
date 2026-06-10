import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemBlockElement: Codable, Hashable, Sendable {
    /// List of CSS selectors or XPaths for elements to block or hide on the page.
    public let blockElement: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        blockElement: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.blockElement = blockElement
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blockElement = try container.decodeIfPresent([String].self, forKey: .blockElement)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.blockElement, forKey: .blockElement)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case blockElement
    }
}