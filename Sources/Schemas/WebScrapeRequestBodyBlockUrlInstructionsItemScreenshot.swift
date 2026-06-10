import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemScreenshot: Codable, Hashable, Sendable {
    /// Captures screenshot of the page.
    public let screenshot: WebScrapeRequestBodyBlockUrlInstructionsItemScreenshotScreenshot?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        screenshot: WebScrapeRequestBodyBlockUrlInstructionsItemScreenshotScreenshot? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.screenshot = screenshot
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.screenshot = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemScreenshotScreenshot.self, forKey: .screenshot)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.screenshot, forKey: .screenshot)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case screenshot
    }
}