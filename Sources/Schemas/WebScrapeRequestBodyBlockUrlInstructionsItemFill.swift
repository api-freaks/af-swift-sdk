import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemFill: Codable, Hashable, Sendable {
    public let fill: WebScrapeRequestBodyBlockUrlInstructionsItemFillFill?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fill: WebScrapeRequestBodyBlockUrlInstructionsItemFillFill? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fill = fill
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fill = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemFillFill.self, forKey: .fill)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fill, forKey: .fill)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fill
    }
}