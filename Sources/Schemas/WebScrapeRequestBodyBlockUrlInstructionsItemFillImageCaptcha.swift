import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha: Codable, Hashable, Sendable {
    /// Captures and fills CAPTCHA values automatically.
    public let fillImageCaptcha: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fillImageCaptcha: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fillImageCaptcha = fillImageCaptcha
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fillImageCaptcha = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .fillImageCaptcha)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fillImageCaptcha, forKey: .fillImageCaptcha)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fillImageCaptcha
    }
}