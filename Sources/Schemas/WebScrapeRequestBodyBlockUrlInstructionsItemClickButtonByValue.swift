import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue: Codable, Hashable, Sendable {
    public let clickButtonByValue: WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValueClickButtonByValue?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clickButtonByValue: WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValueClickButtonByValue? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clickButtonByValue = clickButtonByValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clickButtonByValue = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValueClickButtonByValue.self, forKey: .clickButtonByValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.clickButtonByValue, forKey: .clickButtonByValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clickButtonByValue
    }
}