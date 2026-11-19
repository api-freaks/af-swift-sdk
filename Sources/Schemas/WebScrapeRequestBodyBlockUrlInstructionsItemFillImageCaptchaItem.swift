import Foundation

/// Instructions for locating and solving a single image CAPTCHA challenge.
public struct WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItem: Codable, Hashable, Sendable {
    /// Selector for the CAPTCHA image element.
    public let imagePath: String?
    /// Selector for the field where the CAPTCHA text is entered.
    public let textField: String?
    /// Selector to refresh or update the CAPTCHA image.
    public let imageUpdatePath: String?
    /// Selector indicating a CAPTCHA failure so the solver can retry.
    public let captchaFailedPath: String?
    /// Model used for CAPTCHA solving.
    public let model: WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItemModel?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        imagePath: String? = nil,
        textField: String? = nil,
        imageUpdatePath: String? = nil,
        captchaFailedPath: String? = nil,
        model: WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItemModel? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.imagePath = imagePath
        self.textField = textField
        self.imageUpdatePath = imageUpdatePath
        self.captchaFailedPath = captchaFailedPath
        self.model = model
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imagePath = try container.decodeIfPresent(String.self, forKey: .imagePath)
        self.textField = try container.decodeIfPresent(String.self, forKey: .textField)
        self.imageUpdatePath = try container.decodeIfPresent(String.self, forKey: .imageUpdatePath)
        self.captchaFailedPath = try container.decodeIfPresent(String.self, forKey: .captchaFailedPath)
        self.model = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItemModel.self, forKey: .model)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.imagePath, forKey: .imagePath)
        try container.encodeIfPresent(self.textField, forKey: .textField)
        try container.encodeIfPresent(self.imageUpdatePath, forKey: .imageUpdatePath)
        try container.encodeIfPresent(self.captchaFailedPath, forKey: .captchaFailedPath)
        try container.encodeIfPresent(self.model, forKey: .model)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case imagePath
        case textField
        case imageUpdatePath
        case captchaFailedPath
        case model
    }
}