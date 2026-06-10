import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha: Codable, Hashable, Sendable {
    /// Instructions for solving image captchas.
    public let generalImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaGeneralImageCaptchaItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        generalImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaGeneralImageCaptchaItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.generalImageCaptcha = generalImageCaptcha
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.generalImageCaptcha = try container.decodeIfPresent([WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaGeneralImageCaptchaItem].self, forKey: .generalImageCaptcha)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.generalImageCaptcha, forKey: .generalImageCaptcha)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case generalImageCaptcha
    }
}